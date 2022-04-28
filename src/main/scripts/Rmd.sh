#!/bin/bash

Rscript -e "rmarkdown::render('$1', output_format = 'html_document',output_file = '$1.html', encoding='UTF-8')" > Rmd.Rout &
PID_R=$!
echo $PID_R >> PID #this will allow Funz to kill process if needed

wait $PID_R

rm -f PID

ERROR=`tail -2 *.Rout | grep "Err"`
if [ ! "$ERROR" == "" ]; then
    echo $ERROR >&2
    exit 1
fi