compile-js
==========

Bash script wrapper for google closure compiler. Allows for JS files listed in manifest or wildcard directory to be combined and compiled.
Support file modified time checking and only compiles if the source files are newer then the build files.


Installation
==========
1. Download google closure compiler jar. https://developers.google.com/closure/compiler/
2. Edit the path to compiler.jar within compile-js.
3. Edit .profile within terminal and add an alias to compile-js.sh e.g. alias compile-js="~/Sites/libs/closure/compile-js.sh"

Usage
==========

compile-js [command] [output file] [input file(s)]

Wildcard compile all js files within a directory.

. cd my_js_src; compile-js build ../my_src_build/myapp.min.js
. or
. compile-js build /path/my_src_build/myapp.min.js /path/to/my_src/

Create a manifest list of js files

cd my_js_src; compile-js list manifest.txt

or

compile-js list manifest.txt /path/to/my_src/

Compile js using a manifest file

cd my_js_src; compile-js build ../my_src_build/myapp.min.js manifest.txt

or

compile-js build /path/my_src_build/myapp.min.js /path/to/my_src/manifest.txt

Force re-compile js and ignore modified time

cd my_js_src; compile-js rebuild ../my_src_build/myapp.min.js manifest.txt

or

compile-js rebuild /path/my_src_build/myapp.min.js /path/to/my_src/manifest.txt



