#!/bin/sh
 
cd `dirname $0`/..
 
OUTDIR=reports
OUTFILE=$OUTDIR/rails_best_practices.properties
TMPFILE=`mktemp $OUTDIR/rails_best_practices.XXXXXX`
 
mkdir $OUTDIR 2> /dev/null
rails_best_practices > $TMPFILE
 
STATUS=$?
 
if [ $STATUS -eq 0 ]; then
  echo "YVALUE=0" > $OUTFILE
else
  NUM=`awk '/^Found [0-9]+ errors/{ print $2; }' < $TMPFILE`
  echo "YVALUE=$NUM" > $OUTFILE
fi
 
rm $TMPFILE
