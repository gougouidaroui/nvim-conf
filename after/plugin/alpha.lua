local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local date = os.date("%a %d %b")
local time = os.date("%H:%M")
local v = vim.version()
local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

dashboard.section.header.opts = {
    position = "center",
    hl = 'NeotestFailed',
}


dashboard.section.header.val = {
    "            :h-                                  Nhy`               ",
    "           -mh.                           h.    `Ndho               ",
    "           hmh+                          oNm.   oNdhh               ",
    "          `Nmhd`                        /NNmd  /NNhhd               ",
    "          -NNhhy                      `hMNmmm`+NNdhhh               ",
    "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
    "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
    "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
    "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
    " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
    " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
    " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
    " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
    "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
    "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
    "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
    "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
    "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
    "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
    "       //+++//++++++////+++///::--                 .::::-------::   ",
    "       :/++++///////////++++//////.                -:/:----::../-   ",
    "       -/++++//++///+//////////////               .::::---:::-.+`   ",
    "       `////////////////////////////:.            --::-----...-/    ",
    "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
    "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
    "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
    "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
    "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
    "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
    "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
    "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
    "                        .-:mNdhh:.......--::::-`                    ",
    "                           yNh/..------..`                          ",
    "                                                                    ",
}

dashboard.section.buttons.opts = {
    position = "center",
    cursor = 1,
    hl= 'ErrorMsg',
}

dashboard.section.buttons.val = {
    dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰮗   Find file", ":cd $HOME | Telescope find_files<CR>"),
    dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("e", "   File Explorer", ":Ex<CR>"),
    dashboard.button("c", "   Configuration", ":e ~/.config/nvim/lua/yoon/packer.lua<CR>"),
    dashboard.button("R", "󱘞   Ripgrep", ":Telescope live_grep<CR>"),
    dashboard.button("q", "󰗼   Quit", ":qa<CR>"),
}


function CenterText(text, width)
    local totalPadding = width - #text
    local leftPadding = math.floor(totalPadding / 2)
    local rightPadding = totalPadding - leftPadding
    return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
end

dashboard.section.footer.opts = {
    position = "center",
    cursor = 3,
    hl= 'ErrorMsg',
}

dashboard.section.footer.val = {
    CenterText(date, 50),
    CenterText(time, 50),
    CenterText(version, 50),
}

for _, value in pairs(dashboard.section.buttons.val) do
    value.opts.hl = 'ErrorMsg'
    value.opts.hl_shortcut = 'ErrorMsg'
end

alpha.setup(dashboard.opts)
