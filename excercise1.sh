#!/bin/bash

#Created variables: getting 1 and 2 variables from console, and then put into specyfic names. Next variable is for random name of archive dir. 
first_dir=$1     
target_path_dir=$2
random_tar_dir="Excercise_1-$RANDOM.tar.gz"

#Check if: first variable is name of dir to copy, secound variable is a target path.
if [ -z "$first_dir" ] || [ -z "target_path_dir" ]; then
   echo "Need to write variables! First is a dir that will be copied, secound is a target path."
   exit 1
fi


#Check if directory with large of small files exist.
if [ ! -d $first_dir ]; 
then
    echo "Directory not found!"
else
#If directory exist - we created archive, then do compression and show information about successively creation process.  
    tar -czf $random_tar_dir $first_dir 
    echo "Tar directory: $random_tar_dir CREATED"
    
    #Copied and extract an archive to target directory. 
    tar -xzf $random_tar_dir -C $target_path_dir
    #Delete an archive compressed dir, we need only extract dir. 
    rm $random_tar_dir
fi


