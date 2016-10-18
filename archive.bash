# NAME: Danfeng Wang
# Date: 2016-02-16


#!/bin/bash    

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <ext_list>"
    exit 1
fi

#OPTIND=1
SIZE=-1
DIR1="./"

while getopts "s:t:d:" opt; do
    case  "$opt" in
        s)
        SIZE=$OPTARG
        #echo "SIZE = $SIZE"
        ;;
        t)
        DIR1=$OPTARG
        #echo "TARGETDIR = $DIR1"
        ;;
        d)
        DIR2=$OPTARG
        #echo "DIR2 = $DIR2"
        ;;
    esac
done

shift $((OPTIND-1))
#echo "OPTIND= $OPTIND" 

if [[ -z "$DIR2" ]]; then
    #IFS=$(echo -en "\n\b");
    DIR2="${DIR1}myArchive/" 
    #echo "DIR2 = $DIR2"
fi

if [[ ! -d $DIR2 ]]; then
    {
         mkdir "$DIR2"  
    }
fi
#to see whether myArchive has existed or not

IFS=$(echo -en "\n\b")
cd $DIR1
#IFS=$(echo -en "\n\b");
DIR3="${DIR2}myArchive"
mkdir "$DIR3"
#create a file to store the files to compress
IFS=$(echo -en "\n\b");
for ext in $*; do
    for file in `ls *.$ext`; do
       { 
            #echo $file
           SIZE1=`cat "$file" | wc -c`
           #echo "$file size  is $SIZE1"
           if [[ $SIZE1 -gt $SIZE ]]; then
                {
                    mv ./$file $DIR3
                }
                
           fi
        }
    done
done

tar -cf ${DIR2}myArchive.tar -C $DIR3 .
#tar all files in the directory without including the directory itself
rm -r $DIR3






