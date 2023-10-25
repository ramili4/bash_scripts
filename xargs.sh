#cat <<README > README.md
#My script
#This scripts does this and that
#Usage
#./myscript.sh [options]

#Options:
#-h, --help  Shews Help message
#-v, --verbose Enables verbose mode
#README
directory_to_delete=$1
if [[ -d ${directory_to_delete} ]]; then
    sudo rm -f -d -r ${directory_to_delete}
else
    echo "file1.txt" > file_to_create
    echo "file2.txt" >> file_to_create
    cat file_to_create | xargs touch

    echo "file1.txt" > remove.txt
    echo "file2.txt" >> remove.txt
    cat remove.txt | xargs rm 
fi 