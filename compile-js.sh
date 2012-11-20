#!/bin/bash


#@usage
#compile-js $command $output $input
#compile-js build ../html/assets/js/build/xylo.app.min.js *
#compile-js list manifest.txt
#compile-js build ../html/assets/js/build/xylo.app.min.js manifest.txt
#compile-js rebuild ../html/assets/js/build/xylo.app.min.js manifest.txt
#compile-js build ../html/assets/js/build/xylo.app.min.js booter.js xylo.js service.js

command=$1
output=$2
files=''
list=''
stale=false
compiler=~/Sites/libs/closure/compiler.jar

if test -z "$command"
then
    echo "Please specify a command."
fi


if [ "$command" == "list" ]
then
    for f in $3*.js
    do
        list=$list$f'\n'
        echo -e "$f"
    done
    echo -e $list > $output
fi

if [ "$command" == "rebuild" ]
then
    command="build"
    stale=true
fi

if [ "$command" == "build" ]
then
for f in "$@"
do
    if [ "$f" != "$1" ] && [ "$f" != "$2" ] && [[ $f == *.js ]]
    then
        files=$files$f' '
    fi
done

if test -z "$files"
then
    files=`cat $3`
fi


for f in $files ; do
    list=$list'--js '$f' '
    if test $f -nt $output
    then
    echo $f' is newer then '$output
    stale=true
    fi
done

#echo -e $files

# closure help
# java -jar compiler.jar -h
# --compilation_level WHITESPACE_ONLY SIMPLE_OPTIMIZATIONS ADVANCED_OPTIMIZATIONS
# --externs ../src/js/angular/angular.min.js ../src/js/angular/angular-resource.min.js
if $stale ; then
echo "Compiling $output: "
java -jar $compiler $list --compilation_level SIMPLE_OPTIMIZATIONS --js_output_file $output  --warning_level QUIET --summary_detail_level 3
echo "completed $output."
else
echo "No new files to compile."
fi

fi

