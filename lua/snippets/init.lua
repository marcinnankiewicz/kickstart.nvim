local ls = require 'luasnip'
local extras = require 'luasnip.extras'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local ai = require 'luasnip.nodes.absolute_indexer'
local rep = extras.rep

vim.keymap.set({ 'i' }, '<C-K>', function()
  ls.expand()
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-L>', function()
  ls.jump(1)
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-J>', function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-E>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

ls.add_snippets('go', {
  s('sort-slice-ascending', {
    t 'sort.Slice(',
    i(1),
    t ', func(i, j int) bool {',
    t 'return ',
    rep(ai(1)),
    t '[i] < ',
    rep(ai(1)),
    t '[j]',
    t '})',
  }),
  s('sort-slice-descending', {
    t 'sort.Slice(',
    i(1),
    t ', func(i, j int) bool {',
    t 'return ',
    rep(ai(1)),
    t '[i] > ',
    rep(ai(1)),
    t '[j]',
    t '})',
  }),
  s('paginate-slice', {
    t {
      'func paginate(x []int, skip int, size int) []int {\n',
      'if skip > len(x) {',
      '\tskip = len(x)',
      '}',
      'end := skip + size',
      'if end > len(x) {',
      '	end = len(x)',
      '}',
      'return x[skip:end]\n',
    },
  }),
})
