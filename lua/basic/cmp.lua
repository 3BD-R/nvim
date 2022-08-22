-- nvim-cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

-- local lspkind = require('lspkind')
-- local kind_icons = {
-- 	Text = "",
-- 	Method = "",
-- 	Function = "",
-- 	Constructor = "",
-- 	Field = "ﰠ",
-- 	Variable = "",
-- 	Class = "ﴯ",
-- 	Interface = "",
-- 	Module = "",
-- 	Property = "ﰠ",
-- 	Unit = "塞",
-- 	Value = "",
-- 	Enum = "",
-- 	Keyword = "",
-- 	Snippet = "",
-- 	Color = "",
-- 	File = "",
-- 	Reference = "",
-- 	Folder = "",
-- 	EnumMember = "",
-- 	Constant = "",
-- 	Struct = "פּ",
-- 	Event = "",
-- 	Operator = "",
-- 	TypeParameter = ""
-- }


cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	window = {
		-- 	completion = cmp.config.window.bordered(),
		--	documentation = cmp.config.window.bordered(),
	},

	-- Format the autocomplete menu
	formatting = {
		format = function(entry, vim_item)
			-- vim_item.kind = string.format('%s %s', --kind_icons[vim_item.kind], vim_item.kind)
			vim_item.kind = string.format('%s', vim_item.kind)
			return vim_item
		end
	},


	--		format = function(entry, vim_item)
	--			local kind = require("lspkind").presets.default[vim_item.kind] ..
	--				" " .. vim_item.kind
	-- set a name for each source
	--			vim_item.menu = ({
	--				nvim_lsp = "[LSP]",
	--				luasnip  = "[Luasnip]",
	--				cmdline  = "[Cmd]",
	--				path     = "[Path]",
	--				buffer   = "[Buf]",
	--				nvim_lua = "[Lua]",
	--				look     = "[Look]",
	--				spell    = "[Spell]",
	--				calc     = "[Calc]",
	--				emoji    = "[Emoji]"
	--			})[entry.source.name]
	--			return vim_item
	--		end

	view = {
		entries = "custom",
	},

	experimental = {
		ghost_text = true,
	},

	mapping = cmp.mapping.preset.insert({

		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),

		-- Use Tab and shift-Tab to navigate autocomplete menu
		--       ['<Tab>'] = function(fallback)
		--           if cmp.visible() then
		--               cmp.select_next_item()
		--           elseif luasnip.expand_or_jumpable() then
		--               luasnip.expand_or_jump()
		--           else
		--               fallback()
		--           end
		--         end,
		--       ['<S-Tab>'] = function(fallback)
		--           if cmp.visible() then
		--               cmp.select_prev_item()
		--           elseif luasnip.jumpable(-1) then
		--               luasnip.jump(-1)
		--           else
		--               fallback()
		--           end
		--       end,

		--       ['<CR>'] = cmp.mapping.confirm {
		--           behavior = cmp.ConfirmBehavior.Replace,
		--           select = true,
		--       },

	}),

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'cmdline' },
		{ name = 'path' },
		{ name = 'nvim_lua' },
		{ name = "look" },
		{ name = "calc" },
		{ name = "spell" },
		{ name = "emoji" }
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

cmp.setup.cmdline('?', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})
