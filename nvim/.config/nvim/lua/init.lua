vim.opt.clipboard="unnamedplus"
vim.g.mapleader = ' '

vim.opt.ignorecase = true
vim.opt.smartcase = true

function map(
    mode,
    shortcut,
    command,
    opts
)
    opts = opts or { noremap = true, silent = true }
    vim.keymap.set(
        mode,
        shortcut,
        command,
        opts
    )
end
function nmap(shortcut, command, opts)
    map('n', shortcut, command, opts)
end
function nvmap(shortcut, command, opts)
    map({'n', 'v'}, shortcut, command, opts)
end
function vmap(shortcut, command, opts)
    map('v', shortcut, command, opts)
end

-- redo
nmap("U", "<c-r>")

-- clear search highlights
nmap("<esc>", ":nohlsearch<cr>")
    
-- open vim config
nmap("<leader>oc", ":e ~/.config/nvim/init.lua<cr>")

local vscode = require('vscode')

function nvcall(shortcut, command)
nvmap(shortcut, function () 
    vscode.action(command)
end)
end

function nvlcall(shortcut, command)
nvmap("<leader>" .. shortcut, function () 
    vscode.action(command)
end)
end

nvcall("za", "editor.toggleFold")
nvcall("zA", "editor.toggleFoldRecursively")
nvcall("zo", "editor.unfold")
nvcall("zO", "editor.unfoldRecursively")
nvcall("zc", "editor.fold")
nvcall("zC", "editor.foldRecursively")
nvcall("ze", "editor.gotoNextFold")
nvcall("zi", "editor.gotoPreviousFold")
nvcall("zr", "editor.unfoldAll")
nvcall("zm", "editor.foldAll")
nvcall("z1", "editor.foldLevel1")
nvcall("z2", "editor.foldLevel2")
nvcall("z3", "editor.foldLevel3")
nvcall("z4", "editor.foldLevel4")
nvcall("z5", "editor.foldLevel5")
nvcall("z6", "editor.foldLevel6")
nvcall("z7", "editor.foldLevel7")
nvcall("z8", "editor.foldLevel8")
nvcall("zp", "editor.gotoParentFold")


-- Quick actions
nvlcall("<Space>", "workbench.action.showCommands")
nvlcall("w", "workbench.action.files.save")
nvlcall("W", "workbench.action.files.saveAll")
nvlcall("q", "workbench.action.closeActiveEditor")
nvlcall("Q", "workbench.action.closeAllEditors")
nvlcall("z", "workbench.action.toggleZenMode")

-- Copilot
nvlcall("..", "workbench.action.chat.open")
nvlcall(".,", "workbench.action.quickchat.toggle")
nvlcall("./", "workbench.action.chat.openInNewWindow")

-- Code actions
nvlcall("cf", "editor.action.formatDocument")
nvlcall("c/", "editor.action.refactor")
nvlcall("ca", "editor.action.autoFix")
nvlcall("cf", "editor.action.formatDocument")
nvlcall("ch", "editor.action.showHover")
nvlcall("ck", "editor.action.codeAction")
nvlcall("cq", "editor.action.quickFix")
nvlcall("cr", "editor.action.rename")

-- Debug
nvlcall("dd", "workbench.action.debug.start")
nvlcall("dS", "workbench.action.debug.stop")
nvlcall("dc", "workbench.action.debug.continue")
nvlcall("dp", "workbench.action.debug.pause")

nvlcall("dr", "workbench.action.debug.restart")
nvlcall("di", "workbench.action.debug.stepInto")
nvlcall("ds", "workbench.action.debug.stepOver")
nvlcall("do", "workbench.action.debug.stepOut")
nvlcall("db", "workbench.action.debug.toggleBreakpoint")

nvlcall("dj", "debug.jumpToCursor")

nvlcall("dw", "editor.debug.action.selectiontowatch")


-- editor
nvlcall("eh", "workbench.action.spliteditor")
nvlcall("ev", "workbench.action.spliteditordown")
nvlcall("en", "workbench.action.focusleftgroup")
nvlcall("et", "workbench.action.navigateforward")
nvlcall("et", "workbench.action.navigateback")
nvlcall("ee", "workbench.action.focusbelowgroup")
nvlcall("ei", "workbench.action.focusabovegroup")
nvlcall("eo", "workbench.action.focusrightgroup")
nvlcall("es", "workbench.action.toggleeditorwidths")
nvlcall("em", "workbench.action.minimizeothereditors")
nvlcall("e=", "workbench.action.eveneditorwidths")
nvlcall("ez", "workbench.action.joinallgroups")
nvlcall("eq", "workbench.action.closeeditorsinothergroups")
nvlcall("eq", "workbench.action.closeallgroups")
nvlcall("en", "workbench.action.moveeditortoleftgroup")
nvlcall("ee", "workbench.action.moveeditortobelowgroup")
nvlcall("ei", "workbench.action.moveeditortoabovegroup")
nvlcall("eo", "workbench.action.moveeditortorightgroup")
nvlcall("er", "workbench.action.reloadwindow")
nvlcall("ex", "workbench.action.restartextensionhost")

-- find/replace
nvlcall("ff", "editor.actions.startfindreplaceaction")
nvlcall("fs", "workbench.action.findinfiles")
nvlcall("fr", "workbench.action.replaceinfiles")

-- git / source control
nvlcall("gg", "workbench.scm.active")
nvlcall("gb", "git.checkout")
nvlcall("gc", "git.commit")
nvlcall("gp", "git.push")

-- Open
nvlcall("oo", "workbench.action.quickOpen")
nvlcall("oa", "workbench.action.showAllEditors")
nvlcall("or", "workbench.action.openRecent") 
nvlcall("of", "workbench.action.files.openFile")
nvlcall("od", "workbench.action.files.openFolder")

-- Show
nvlcall("sd", "workbench.view.debug")
nvlcall("se", "workbench.view.explorer")
nvlcall("ss", "workbench.view.search")
nvlcall("sg", "workbench.view.scm")
nvlcall("so", "outline.focus")
nvlcall("sm", "workbench.view.extension.bookmarks")
nvlcall("sp", "workbench.panel.markers.view.focus")
nvlcall("st", "workbench.view.extension.test")
nvlcall("sc", "todo-tree.highlights")
nvlcall("sr", "references-view.find")
nvlcall("sx", "workbench.action.extensions")
nvlcall("sw", "workbench.debug.action.focusWatchView")
nvlcall("so", "workbench.action.output.toggleOutput")

-- Terminal
nvlcall("tt", "workbench.action.terminal.toggleTerminal")
nvlcall("tn", "workbench.action.terminal.new")
nvlcall("tm", "workbench.action.toggleMaximizedPanel")

-- UI toggles
nvlcall("ua", "workbench.action.toggleActivityBarVisibility")
nvlcall("ub", "workbench.action.toggleSidebarVisibility")
nvlcall("ud", "workbench.action.toggleLightDarkThemes")
nvlcall("uf", "workbench.action.toggleFullScreen")
nvlcall("us", "workbench.action.toggleStatusbarVisibility")
nvlcall("up", "workbench.action.togglePanel")
nvlcall("ut", "workbench.action.selectTheme")
nvlcall("uc", "breadcrumbs.toggle")


nvlcall("z", "workbench.action.toggleZenMode")

