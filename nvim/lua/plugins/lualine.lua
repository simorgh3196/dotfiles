local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

function M.config()
	if vim.g.started_by_firenvim then
		return
	end

	local lualine = require("lualine")

    -- local icons = require("modules.ui.icons")

	-- Color table for highlights
	-- stylua: ignore
	local colors = {
		lightgray = "#aeaece",
		gray      = "#8e8ea3",
		yellow    = "#ecbe7b",
		cyan      = "#008080",
		darkblue  = "#081633",
		green     = "#98be65",
		orange    = "#ff8800",
		violet    = "#a9a1e1",
		magenta   = "#c678dd",
		blue      = "#51afef",
		red       = "#ec5f67",
	}

	local mode_color = {
		n = colors.green,
		i = colors.blue,
		v = colors.red,
		[""] = colors.red,
		V = colors.red,
		c = colors.magenta,
		no = colors.red,
		s = colors.orange,
		S = colors.orange,
		[""] = colors.orange,
		ic = colors.yellow,
		R = colors.violet,
		Rv = colors.violet,
		cv = colors.red,
		ce = colors.red,
		r = colors.cyan,
		rm = colors.cyan,
		["r?"] = colors.cyan,
		["!"] = colors.red,
		t = colors.red,
	}

	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand("%:p:h")
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	-- Config
	local config = {
		options = {
			-- Disable sections and component separators
			component_separators = "",
			section_separators = "",
			theme = "edge",
		},
		sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = {},
			lualine_x = {},
		},
		inactive_sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
		tabline = {},
		extensions = {
			"quickfix",
			"nvim-tree",
			"nvim-dap-ui",
			"toggleterm",
			"fugitive",
			{
				sections = mini_sections,
				filetypes = { "lspsagaoutline" },
			},
			{
				sections = mini_sections,
				filetypes = { "DiffviewFiles" },
			},
		}
	}

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x ot right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left {
		function()
			return "▊"
		end,
		color = function()
			-- auto change color according to neovims mode
			return { fg = mode_color[vim.fn.mode()] }
		end,
		padding = { left = 0, right = 1 }, -- We don"t need space before this
	}

	ins_left {
		"filetype",
		cond = conditions.buffer_not_empty,
        icon_only = true,
        separator = "",
        padding = { left = 1, right = 0 },
	}

	ins_left {
		"filename",
		cond = conditions.buffer_not_empty,
		color = { fg = colors.gray },
        path = 1,
	}

    -- ins_left {
    --     function()
    --         local navic = require("nvim-navic")
    --         local ret = navic.get_location()
    --         return ret:len() > 2000 and "navic error" or ret
    --     end,
    --     cond = function()
    --         if package.loaded["nvim-navic"] then
    --             local navic = require("nvim-navic")
    --             return navic.is_available()
    --         end
    --     end,
    --     color = { fg = colors.magenta },
    -- }

	ins_left {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		-- symbols = {
        --     error = icons.diagnostics.Error,
        --     warn = icons.diagnostics.Warning,
        --     info = icons.diagnostics.Information,
        -- },
		diagnostics_color = {
			color_error = { fg = colors.red },
			color_warn = { fg = colors.yellow },
			color_info = { fg = colors.cyan },
		},
	}

	-- Insert mid section. You can make any number of sections in neovim :)
	-- for lualine it"s any number greater then 2
	ins_left {
		function()
			return "%="
		end,
	}

	ins_left {
		-- Lsp server name .
		function()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end,
		icon = " LSP:",
		color = { fg = colors.lightgray },
	}

	-- Add components to right sections
	ins_right {
		"o:encoding", -- option component same as &encoding in viml
		fmt = string.upper, -- I"m not sure why it"s upper case either ;)
		cond = conditions.hide_in_width,
		color = { fg = colors.gray },
	}

	ins_right {
		"fileformat",
		fmt = string.upper,
		icons_enabled = true,
		color = { fg = colors.gray },
	}

	ins_right {
		"branch",
		icon = "",
		color = { fg = colors.violet },
	}

	ins_right {
		"diff",
		-- Is it me or the symbol for modified us really weird
		symbols = { added = " ", modified = "柳", removed = " " },
		cond = conditions.hide_in_width,
	}

	-- Now don"t forget to initialize lualine
	lualine.setup(config)
end

return M
