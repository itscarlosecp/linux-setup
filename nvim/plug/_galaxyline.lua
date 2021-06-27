local gl = require"galaxyline"
local condition = require"galaxyline.condition"
local gls = gl.section
gl.short_line_list = {"NvimTree", "vista", "dbui", "packer"}

local colors = {
	-- bg = "#282A36",
	bg = "#282828",
	yellow = "#DCDCAA",
	dark_yellow = "#D7BA7D",
	cyan = "#4EC9B0",
	green = "#608B4E",
	light_green = "#B5CEA8",
	string_orange = "#CE9178",
	orange = "#CE9178",
	purple = "#C586C0",
	magenta = "#D16D9E",
	gray =	"#CCCCCC",
	blue = "#5fafd7",
	vivid_blue = "#4FC1FF",
	light_blue = "#9CDCFE",
	red = "#D16969",
	error_red = "#F44747",
	info_yellow = "#FFCC66"
}

gls.left[1] = {
	ViMode = {
		provider = function()
			-- Auto change color according the vim mode
			local mode_color = {
				n = colors.blue,
				i = colors.info_yellow,
				v = colors.purple,
				[""] = colors.purple,
				V = colors.purple,
				c = colors.magenta,
				no = colors.blue,
				s = colors.orange,
				S = colors.orange,
				ic = colors.yellow,
				R = colors.red,
				Rv = colors.red,
				cv = colors.blue,
				ce = colors.blue,
				r = colors.cyan,
				rm = colors.cyan,
				["r?"] = colors.cyan,
				["!"] = colors.blue,
				t = colors.blue
			}
			vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
			return "▊ "
		end,
		highlight = {colors.red, colors.bg}
	}
}
print(vim.fn.getbufvar(0, "ts"))
vim.fn.getbufvar(0, "ts")

gls.left[2] = {
	GitIcon = {
		provider = function()
			return " "
		end,
		condition = condition.check_git_workspace,
		separator = " ",
		separator_highlight = {"NONE", colors.bg},
		highlight = {colors.orange, colors.bg}
	}
}

gls.left[3] = {
	GitBranch = {
		provider = "GitBranch",
		condition = condition.check_git_workspace,
		separator = " ",
		separator_highlight = {"NONE", colors.bg},
		highlight = {colors.gray, colors.bg}
	}
}

gls.left[4] = {
	FileName = {
		provider = "FileName",
		icon = "  ",
		highlight = {colors.gray, colors.bg}
	}
}

gls.right[1] = {
	ShowLspClient = {
					provider = "GetLspClient",
					condition = function()
							local tbl = {['dashboard'] = true, [' '] = true}
							if tbl[vim.bo.filetype] then return false end
							return true
					end,
					icon = " ",
					highlight = {colors.grey, colors.bg},
	}
}

gls.right[2] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "  ",
		highlight = {colors.error_red, colors.bg},
	}
}

gls.right[3] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "  ",
		highlight = {colors.orange, colors.bg}
	}
}

gls.right[4] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		icon = "  ",
		highlight = {colors.vivid_blue, colors.bg}
	}
}

gls.right[5] = {
	DiagnosticInfo = {
		provider = "DiagnosticInfo",
		icon = "  ",
		highlight = {colors.info_yellow, colors.bg}
	}
}

gls.right[6] = {
	LineInfo = {
		provider = "LineColumn",
		separator = "  ",
		separator_highlight = {"NONE", colors.bg},
		highlight = {colors.gray, colors.bg}
	}
}

gls.right[7] = {
	PerCent = {
		provider = "LinePercent",
		separator = " ",
		separator_highlight = {"NONE", colors.bg},
		highlight = {colors.gray, colors.bg}
	}
}

gls.right[8] = {
	Tabstop = {
		provider = function()
			return "Indentation: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
		end,
		condition = condition.hide_in_width,
		separator = " ",
		separator_highlight = {"NONE", colors.bg},
		highlight = {colors.gray, colors.bg}
	}
}

gls.right[9] = {
	BufferType = {
		provider = "FileTypeName",
		condition = condition.hide_in_width,
		separator = " ",
		separator_highlight = {"NONE", colors.bg},
		highlight = {colors.gray, colors.bg}
	}
}

gls.right[10] = {
	FileEncode = {
		provider = "FileEncode",
		condition = condition.hide_in_width,
		separator = " ",
		separator_highlight = {"NONE", colors.bg},
		highlight = {colors.gray, colors.bg}
	}
}

gls.right[11] = {
	Space = {
		provider = function()
			return " "
		end,
		separator = " ",
		separator_highlight = {"NONE", colors.bg},
		highlight = {colors.orange, colors.bg}
	}
}

gls.short_line_left[1] = {
	BufferType = {
		provider = "FileTypeName",
		separator = " ",
		separator_highlight = {"NONE", colors.bg},
		highlight = {colors.gray, colors.bg}
	}
}

gls.short_line_left[2] = {
	SFileName = {
		provider = "SFileName",
		condition = condition.buffer_not_empty,
		highlight = {colors.gray, colors.bg}
	}
}

gls.short_line_right[1] = {
	BufferIcon = {
		provider = "BufferIcon",
		highlight = {colors.gray, colors.bg}
	}
}

