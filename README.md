compile-js
==========

Bash script wrapper for google closure compiler. Allows for JS files listed in a manifest or wildcard directory to be combined and compiled. 
By using a manifest file you can specify the order in which the files will be combined, therefore avoiding javascript dependency issues.
Supports file modified time checking and only compiles if the source files are newer then the build files.


Installation
==========
1. Download google closure compiler jar. https://developers.google.com/closure/compiler/
2. Edit the path to compiler.jar within compile-js.
3. chmod 755 compile-js.sh file to use an executable
4. Edit ~/.profile within terminal and add an alias to compile-js.sh e.g. alias compile-js="~/Sites/git/github/compile-js/compile-js.sh"

Usage
==========

compile-js [command] [output file] [input file(s)]

Wildcard compile all js files within a directory.
* compile-js build /path/my_src_build/myapp.min.js /path/to/my_src/

Compile multiple js files
* compile-js build /path/my_src_build/myapp.min.js /path/to/my_src/myfile1.js /path/to/my_src/myfile2.js /path/to/my_src/myfile3.js

Create a manifest list of js files
* compile-js list /path/to/my_src/manifest.txt /path/to/my_src/

Compile js using a manifest file
* compile-js build /path/to/my_src_build/myapp.min.js /path/to/my_src/manifest.txt

Force re-compile js and ignore modified time
* compile-js rebuild /path/to/my_src_build/myapp.min.js /path/to/my_src/manifest.txt



