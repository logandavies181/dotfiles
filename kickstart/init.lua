require('defaults.options')
require('lazy').setup(
  "plugins",
  require('defaults.lazyoptions')
)
require('custom/keymaps')
require('custom/reopen')
require('custom/options')
require('graphqlzp')
require('bom')
require('giturl')
-- vim: ts=2 sts=2 sw=2 et
