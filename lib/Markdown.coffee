ghm = require 'github-flavored-markdown'
fs  = require 'fs'

class Markdown
  read_css = ->
    '<style type="text/css">' +
    fs.readFileSync( __dirname + '/ghmdown.css' ).toString() +
    '</style>' + "\n"

  read_mdown = (md_file) ->
    fs.readFileSync( md_file ).toString()
  
  convert: (md_file) ->
    html_file = md_file.split('.')[0] + '.html'
    html  = ghm.parse read_mdown(md_file), "isaacs/npm"

    fs.writeFile html_file, read_css() + html, (err)->
      console.log err if err
      console.log "Converted the #{md_file} file to #{html_file}"

exports.Markdown = Markdown
