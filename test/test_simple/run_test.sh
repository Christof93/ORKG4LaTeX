#!/bin/bash
printf "\n---------------------------- Executing simple test -----------------------------------.\n" 
echo '<?xpacket begin="?" id="48fdc517-5814-4d0c-cd03-0c296941c6"?>\n' > test.xmp_metadata.xml
lualatex --interaction=batchmode $1/test.tex
mv test.aux $1
mv test.log $1
mv test.pdf $1
mv test.xmp_metadata.xml $1
cmp --silent $1/test.xmp_metadata.xml $1/xmp_metadata_expected.xml && 
printf "\n\033[0;32m----------------------------### simple test PASS: XMP as expected! ###----------------------------------------\033[0m\n" || 
printf "\n\033[0;31m----------------------------### simple test FAIL: XMP not as expected! ###------------------------------------\033[0m\n"