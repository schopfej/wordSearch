#!/bin/bash
########  
# 
# Search for a given word
#
#######  

echo "Enter the path name you would like to work in: "
read pathName

##### check if the string is zero or not
if [[ -z ${pathName} ]]
then
    pathName=$(pwd)
    echo "Search in current directory:"
    echo $pathName
    
else
    echo "Search in this path:"
    echo ${pathName}
    cd $pathName
fi


echo "Enter the word you like to search for: "
read keyWord
if [[ -z ${keyWord} ]]
then
    echo "No Word was added, exit program"
    break
else
    echo "The Word is: $keyWord"
fi

##### only searches for files and not directories
allFiles=$(find ${pathName} -maxdepth 1 -type f)
countEintrage=1
for j in $allFiles
do
    #### count the occurence 
    search=$(grep -c $keyWord $j)
    
    if [ $search -gt 0 ]
    then
        echo "The searched word $keyWord was found in file : $j"
    fi
    let countEintrage=countEintrage+1
    
done
