#!/usr/bin/bash

DATA_REPO_DIR=.

checkNumberOfCsvFile() {
  dir_path=$1
  if [ ! -d ${dir_path} ]; then
	return
  fi
  echo "NUMBER OF CSV FILES:" `echo $1` 
  dirs=`find $dir_path -mindepth 1 -maxdepth 1 -type d | sort`
  for dir in $dirs;
  do
     echo -en "\t " `find $dir -name "ata_write.*" | wc -l` 
     echo -en "\t (CSV\t " `find $dir -name "ata_write.csv" | wc -l` 
     echo -e "\t ZIP\t " `find $dir -name "ata_write.zip" | wc -l` ")\t" `basename $dir` 
  done
}

dataset_types=("win7-120gb-hdd" "win7-250gb-hdd" "win7-120gb-ssd" "win7-250gb-ssd" "win7ent_bl-250gb-ssd" "win2008r2-250gb-ssd")

echo "==========="
echo " ORIGINAL "
echo "==========="
for (( i=0; i < ${#dataset_types[@]}; i++)) {
  checkNumberOfCsvFile "${DATA_REPO_DIR}/dataset/original/${dataset_types[$i]}"
}
echo "==================="
echo "TOTAL OF ORIGINAL:"
echo "==================="
checkNumberOfCsvFile "${DATA_REPO_DIR}/dataset/original/"

echo "==========="
echo " EXTRA "
echo "==========="
for (( i=0; i < ${#dataset_types[@]}; i++)) {
  checkNumberOfCsvFile "${DATA_REPO_DIR}/dataset/extra/${dataset_types[$i]}"
}
echo "==================="
echo "TOTAL OF EXTRA:"
echo "==================="
checkNumberOfCsvFile "${DATA_REPO_DIR}/dataset/extra/"

echo "==================="
echo "TOTAL:"
echo "==================="
checkNumberOfCsvFile "${DATA_REPO_DIR}/dataset/"

