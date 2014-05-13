md2html
=======

Created by Ed Botzum

md2html is a simple command line utility that generates html from mardown by combining the github-flavored-mardown module with [Andy Ferra's css](https://gist.github.com/andyferra/2554919#file-github-css).

I built it to learn how to write a command line utlity with node and publish to npm.

Install
-------

```bash
npm install ghmd2html -g
```

Usage
-------

```bash
md2html your_markdown_filename.md
```

Change Log
------------------

### 0.3.6

  * BUGFIX: Write out the File that is Being Converted

### 0.3.5

  * Support for wildcards added - aka *.md or *.markdown.
  * The output directory can now be specified with -o or --output.

### 0.3.0

  * Rendering Engine Updated to marked.
  * Highlight.js included for highlighting with solarized dark.

### 0.2.3

  * Initial release of the utility.

License
------------------

The MIT License (MIT)

Copyright (c) 2014 Ed Botzum

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
