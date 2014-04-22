marked = require 'marked'
fs     = require 'fs'

# Synchronous highlighting with highlight.js
marked.setOptions(
  highlight: (code) ->
    require('highlight.js').highlightAuto(code).value
  langPrefix: ''
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
    '<script src="http://yandex.st/highlightjs/8.0/highlight.min.js"></script>' +
    '<script>hljs.initHighlightingOnLoad();</script>'

  convert: (md_file, out_dir = '.') ->
    if md_file.indexOf( '*' ) >= 0
      dir = ''
      dir = md_file.split( '*' )[0] if /\/|\\/.exec(md_file)
      dir = './' + dir unless /\/|\\/.exec(dir) == 0
      console.log "Searching for files to process in #{dir}"
      fs.readdir dir, (err, files) ->
        if (err)
          console.log err
        matching_ext = (element) ->
          element.indexOf( md_file.split('.')[1] ) > 0
        for file in files.filter( matching_ext )
          html_file = out_dir + '/' + file.split('.')[0] + '.html'
          html      = marked read_mdown("#{dir}/#{file}")

          fs.writeFile html_file, read_css() + html, (err)->
            console.log err if err
            console.log "  Converted #{file} to #{html_file}"
    else
      html_file = out_dir + '/' + md_file.split('.')[0] + '.html'
      html      = marked read_mdown(md_file)

      fs.writeFile html_file, read_css() + html, (err)->
        console.log err if err
        console.log "Converted #{md_file} to #{html_file}"

exports.Markdown = Markdown
