require('defaults.options')
require('lazy').setup(
  "plugins",
  require('defaults.lazyoptions')
)
require('custom/keymaps')
require('custom/reopen')
require('custom/options')
require('graphqlsp')
require('bom')
-- vim: ts=2 sts=2 sw=2 et
