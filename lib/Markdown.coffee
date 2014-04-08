marked = require 'marked'
fs     = require 'fs'

# Synchronous highlighting with highlight.js
marked.setOptions(
  highlight: (code) ->
    require('highlight.js').highlightAuto(code).value
  )

class Markdown
  read_css = ->
    '<style type="text/css">' +
    fs.readFileSync( __dirname + '/ghmdown.css' ).toString() +
    '</style>' +
    '<link rel="stylesheet" href="http://yandex.st/highlightjs/8.0/styles/solarized_dark.min.css">' +
    "\n"

  read_mdown = (md_file) ->
    fs.readFileSync( md_file ).toString() +
    '<script src="http://yandex.st/highlightjs/8.0/highlight.min.js"></script>'

  convert: (md_file) ->
    html_file = md_file.split('.')[0] + '.html'
    html  = marked read_mdown(md_file)

    fs.writeFile html_file, read_css() + html, (err)->
      console.log err if err
      console.log "Converted the #{md_file} file to #{html_file}"

exports.Markdown = Markdown
