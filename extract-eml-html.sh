#!/bin/bash

if [ "$#" != "1" ]
then
    echo "Usage - $0 <eml file>"
    exit
fi

EML_FILE="$1"
DIR=`echo $EML_FILE | tr '.' '_'`

emlExtractor.pl $EML_FILE
if [ "$?" != "0" ]
then
    echo "
    Error: failed to run emlExtractor.pl.
    Make sure you have downloaded it from https://github.com/sg3des/emlExtractor
    You should also ensure you have included it in PERL's @INC by putting this
    in your .profile or .zprofile:

    export PERL5LIB="/opt/local/lib/perl5/:$PERL5LIB"

    You should also ensure you use cpanm to install the MIME support perl needs to
    run emlExtractor.pl 
    
    sudo cpan App::cpanminus
    cpanm MIME/QuotedPrint/Perl.pm
    " 1>&2

    exit 1
fi

cd $DIR

INPUT_HTML="html.html"
OUTPUT_HTML="index.html"

cat $INPUT_HTML | sed -e 's/src="cid:\([^@"]*\)@[0-9A-Z.]*"/src="\1"/g' > $OUTPUT_HTML

#.. Now, get rid of bracketed files.

BRACKETED_FILES=`ls | grep "\["`

for i in $BRACKETED_FILES
do
    NEW_FILENAME=`echo $i | sed -e 's/\[[0-9A-Z]*\]//'`
    mv $i $NEW_FILENAME
    echo "Moved $i to $NEW_FILENAME" 
done

open input.html