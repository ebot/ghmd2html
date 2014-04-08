markdown = require __dirname + "/../lib/Markdown.coffee"

VERSION = '0.3.4'

display_help = ->
  console.log '--------------------------------------------'
  console.log "             md2html - #{VERSION}"
  console.log '--------------------------------------------'
  console.log "\nConverts the specified mdown file to html.\n"
  console.log "  Example   md2html [file_name]\n"
  console.log '  --help    Displays this help menu.'
  console.log '  --version Displays the program\'s version.'

if process.argv.length < 3
  display_help()
else
  param = process.argv[2]

  if param == '--version'
    console.log VERSION
  else if param == '--help'
    display_help()
  else
    md = new markdown.Markdown
    md.convert param
