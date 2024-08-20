usr/bin/bash

DATA_REPO_DIR=.

checkNumberOfCsvDir() {
  dir_path=$1
  if [ ! -d ${dir_path} ]; then
        return
  fi
  echo "NUMBER OF CSV DIRECTORIES:" `echo $1` 
  dirs=`find $dir_path -mindepth 1 -maxdepth 1 -type d | sort`
  for dir in $dirs;
  do
     echo -e "\t " `find $dir -name "ata_write.*" | wc -l` `basename $dir`
  done
}

dataset_types=("win7-120gb-hdd" "win7-250gb-hdd" "win7-120gb-ssd" "win7-250gb-ssd" "win7ent_bl-250gb-ssd" "win2008r2-250gb-ssd")

echo "==========="
echo " ORIGINAL "
echo "==========="
for (( i=0; i < ${#dataset_types[@]}; i++)) {
  checkNumberOfCsvDir "${DATA_REPO_DIR}/dataset/original/${dataset_types[$i]}"
}
echo "==================="
echo "TOTAL OF ORIGINAL:"
echo "==================="
checkNumberOfCsvDir "${DATA_REPO_DIR}/dataset/original/"

echo "==========="
echo " EXTRA "
echo "==========="
for (( i=0; i < ${#dataset_types[@]}; i++)) {
  checkNumberOfCsvDir "${DATA_REPO_DIR}/dataset/extra/${dataset_types[$i]}"
}
echo "==================="
echo "TOTAL OF EXTRA:"
echo "==================="
checkNumberOfCsvDir "${DATA_REPO_DIR}/dataset/extra/"

echo "==================="
echo "TOTAL:"
echo "==================="
checkNumberOfCsvDir "${DATA_REPO_DIR}/dataset/"
