require('defaults.options')
require('lazy').setup(
{
  require('defaults.plugins'),
  require('custom.plugins'),
},
  require('defaults.lazyoptions')
)
require('custom/keymaps')
require('custom/reopen')
require('custom/options')
-- vim: ts=2 sts=2 sw=2 et
