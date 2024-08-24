require('defaults.options')
require('lazy').setup(
{
  require('defaults.plugins'),
  require('custom.plugins'),
  require('kickstart.plugins.neo-tree'),
},
  require('defaults.lazyoptions')
)
require('custom/options')
require('custom/keymaps')
require('custom/reopen')
-- vim: ts=2 sts=2 sw=2 et
