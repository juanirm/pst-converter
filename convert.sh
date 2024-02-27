#!/bin/bash
for INDIRfile in $INDIR/*.pst
do
  readpst -u -o $OUTDIR $INDIRfile 
done
find out -type d | tac | grep -v '^out$' | xargs -d '\n' -I{} mv {} {}.sbd
find out -name mbox -type f | xargs -d '\n' -I{} echo '"{}" "{}"' | sed -e 's/\.sbd\/mbox"$/"/' | xargs -L 1 mv
find out -empty -type d | xargs -d '\n' rmdir
