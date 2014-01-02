ASDF-linguist is a set of extensions to the ASDF build system for Common Lisp
for compiling various languages and running various preprocessing tools (Sass,
LESS, etc.) on files in your project.

ASDF is very easy to extend to handle other languages within the same project,
eg. compiling C source files, but this ease of extensibility leads to people
reimplementing these basic capabilities in different, ad-hoc ways. This system
attempts to solve this by providing one and only one way to do these things.

# Extensions

* Languages
  * C
  * C++
  * Fortran
* Web
  * CSS preprocessors
    * [LESS](http://lesscss.org/) ✓
    * [Myth](http://www.myth.io/) ✓
    * [Sass](http://sass-lang.com/) ✓
  * Tools
    * CSS/JSS Minifiers
      * [YUI Compressor](http://yui.github.io/yuicompressor/)
  * Compile-to-Javascript
    * [CoffeeScript](http://coffeescript.org/)
    * [ParenScript](http://common-lisp.net/projects/parenscript/)
    * [Roy](http://roy.brianmckenna.org/)
* Build systems
  * Make
  * CMake
* Tools
  * Text Processing
    * [org-mode](http://orgmode.org/)
    * [pandoc](http://johnmacfarlane.net/pandoc/)
  * Graphics
    * [dot](http://www.graphviz.org/)
    * [ditaa](http://ditaa.sourceforge.net/)

# License

Copyright (c) 2014 Fernando Borretti <eudoxiahp@gmail.com>

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
