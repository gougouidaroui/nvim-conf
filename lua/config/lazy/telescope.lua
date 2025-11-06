return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-media-files.nvim",
    },
    config = function()
        require("telescope").setup {
            defaults = {
                layout_config = {
                    horizontal = {
                        preview_width = 0.6, -- Allocate 60% of window to preview
                        width = 0.9, -- Use 90% of terminal width
                        height = 0.9, -- Use 90% of terminal height
                    },
                },
                preview = {
                    check_mime_type = true,
                    mime_hook = function(filepath, bufnr, opts)
                        local is_image = function(filepath)
                            local image_extensions = { "png", "jpg", "jpeg", "gif" }
                            local split_path = vim.split(filepath:lower(), ".", { plain = true })
                            local extension = split_path[#split_path]
                            return vim.tbl_contains(image_extensions, extension)
                        end
                        if is_image(filepath) then
                            -- Use chafa without fixed size, let Kitty handle scaling
                            local cmd = string.format("chafa --format=kitty --stretch %q", filepath)
                            local job_id = vim.fn.jobstart(cmd, {
                                stdout_buffered = true,
                                on_stdout = function(_, data)
                                    if data then
                                        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
                                    end
                                end,
                                on_stderr = function(_, data)
                                    if data and data[1] ~= "" then
                                        vim.notify("chafa error: " .. table.concat(data, "\n"), vim.log.levels.ERROR)
                                    end
                                end,
                                on_exit = function()
                                    -- Clean up if needed
                                end,
                            })
                            if job_id <= 0 then
                                require("telescope.previewers.utils").set_preview_message(
                                    bufnr,
                                    opts.winid,
                                    "Failed to start chafa"
                                )
                            end
                        else
                            require("telescope.previewers.utils").set_preview_message(
                                bufnr,
                                opts.winid,
                                "No preview available"
                            )
                        end
                    end,
                },
            },
            extensions = {
                media_files = {
                    backend = "ueberzugpp",
                    backend_options = {
                        format = "kitty", -- Use Kitty's image protocol
                        stretch = true, -- Stretch to fit preview window
                    },
                    filetypes = { "png", "jpg", "jpeg", "gif" }, -- Exclude problematic types
                    find_cmd = "rg",
                },
            },
        }

        require("telescope").load_extension("media_files")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git Files" })
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "Grep Word Under Cursor" })
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "Grep WORD Under Cursor" })
        vim.keymap.set("n", "<leader>ps", function()
            builtin.live_grep()
        end, { desc = "Grep String" })
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Help Tags" })
        vim.keymap.set("n", "<leader>pm", function()
            require("telescope").extensions.media_files.media_files()
        end, { desc = "Media Files" })
    end,
}
