program = require 'commander'
markdown = require __dirname + "/../lib/Markdown.coffee"

program
  .version('0.3.6')
  .option('-o, --output <value>', 'Specify the directory to output to.')
  .parse(process.argv)

md = new markdown.Markdown
if program.args.length == 0
  console.log program.help()
else if program.output
  md.convert program.args[0], program.output
else
  md.convert program.args[0]
