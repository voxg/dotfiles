local org = require('orgmode')
org.setup_ts_grammar()
org.setup({
    org_agenda_files = { '~/notes/*', },
    org_default_notes_file = '~/notes/refile.org',
})

