local global = require("core.global")
local modules_dir = global.modules_dir
local packer = nil

-- Packer

local Packer = {}
Packer.__index = Packer

function Packer:init_ensure_plugins()
	local jetpackfile = vim.fn.stdpath("data") .. "/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim"
	local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
	if vim.fn.filereadable(jetpackfile) == 0 then
		vim.fn.system(string.format("curl -fsSLo %s --create-dirs %s", jetpackfile, jetpackurl))
	end

	self:load_packer()
end

function Packer:load_packer()
	if not packer then
		vim.api.nvim_command("packadd vim-jetpack")
		packer = require("jetpack.packer")
	end

	self:load_plugins()

	packer.startup(function(use)
		use({ "tani/vim-jetpack", opt = true })

		for _, repo in ipairs(self.repos) do
			use(repo)
		end
	end)
end

function Packer:load_plugins()
	self.repos = {}

	local get_plugins_list = function()
		local list = {}
		local tmp = vim.split(vim.fn.globpath(modules_dir, "*/plugins.lua"), "\n")
		local subtmp = vim.split(vim.fn.globpath(modules_dir, "*/user/plugins.lua"), "\n")
		for _, v in ipairs(subtmp) do
			if v ~= "" then
				table.insert(tmp, v)
			end
		end
		for _, f in ipairs(tmp) do
			list[#list + 1] = f:sub(#modules_dir - 6, -1)
		end
		return list
	end

	local plugins_file = get_plugins_list()
	for _, m in ipairs(plugins_file) do
		local repos = require(m:sub(0, #m - 4))
		for repo, conf in pairs(repos) do
			self.repos[#self.repos + 1] = vim.tbl_extend("force", { repo }, conf)
		end
	end
end

-- plugins

local plugins = setmetatable({}, {
	__index = function(_, key)
		if not packer then
			Packer:load_packer()
		end
		return packer[key]
	end,
})

function plugins.ensure_plugins()
	Packer:init_ensure_plugins()
end

function plugins.load_compile()
	-- no ops
end

return plugins
