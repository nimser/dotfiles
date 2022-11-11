require'pounce'.setup{
  accept_keys = "TESIRUNACVODPLWGXHYQJBKFMZ",
  accept_best_key = "<enter>",
  multi_window = true,
  debug = false,
}
-- reuse the map helper function defined in 'mappings'
require('mappings').set_pounce_mappings()

