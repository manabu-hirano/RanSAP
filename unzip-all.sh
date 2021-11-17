#!/bin/bash

## Overrwrite option
CP_ZIP_OPT="-n"

## Create a list of .zip files
ZIPLIST=(`find . -name \*.zip -print`)

## Unzip 

echo "Do you extract ZIP files?"
read -p "y or n) " yn
case $yn in
    [Yy]* )
       ;;
    * )
       echo "Canceled"
       exit;;
esac

## Unzip files in DEST_DIR
for ZIPNAME in "${ZIPLIST[@]}"
do
    unzip ${CP_ZIP_OPT} ${ZIPNAME} -d ./dataset
    if [ $? = 0 ]; then
	echo "Unzip success: ${ZIPNAME}"
        rm ${ZIPNAME}
    fi
done

