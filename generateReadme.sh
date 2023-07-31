echo "Generating README.md ..."

#The path of github repository in main branch
githubPath="https://github.com/AlyssonRhuan/learning/tree/main"

#This Shell script get all directories and sub directories
#and generate the tree with github page link

#The main folder in local machine
baseFolder=$PWD

#Array with all directories and sub directories
folderArray=("$baseFolder")

#Tab size to write the tree
tab="   "

#Initial array lenth
len=1

for (( i=0; i<$len; i++ ))
do
    #Get the folders inside the folder item
    folder="${folderArray[$i]}"

    for entry in "$folder"/*
    do

    #If this path is a directory
    if [ -d "$entry" ]; then
        #Add the path in the array
        folderArray+=("$entry")

        #And refresh the lenth
        len="${#folderArray[@]}"
    fi
    done
done

#Here we sort the array alphabetically
IFS=$'\n' folderArray=($(sort <<<"${folderArray[*]}")); unset IFS

#This is the header of the readme file
readme="## Hello

### This repository is a centralized place to store theoretical studies.
### It will be organized by folders for each subject, and in MD files to group subjects/chapters.
#### Practical studies will have separate repositories.

# Table of Contents

"

#After get all folder, now we write the tree
for (( i=1; i<$len; i++ ))
do
    #This folder has the absolute path
    folder="${folderArray[$i]}"

    #And here we replace the baseFolder path to get only the folders that we need
    relativePath=${folder//$baseFolder/""}

    #And here we set the special charactere with space
    path=${relativePath//" "/"%20"}
    path=${path//"("/"%28"}
    path=${path//")"/"%29"}
    
    #Now we split the path variable in / (slash) to know how many parents this folder has
    folderSplited=$(echo $path | awk -F/ '{print $NF}')
    
    #The name of the folder we need the space
    name=${folderSplited//"%20"/" "}    
    name=${name//"%28"/"("}   
    name=${name//"%29"/")"}    

    #And remove the / (slash) of the path
    name=${name//"/"/""}   
    
    #Now we get the quantity of the slashs
    res="${path//[^\/]}"

    #To constructs the tabulation in the tree
    tabs=""
    for (( it=1; it<${#res}; it++ ))
    do
        tabs+=$tab
    done

    #Here we concat the path in the readme
    readme+="$tabs* [$name]($githubPath$path)"
    
    #And concat a new line
    readme+="
"
done

readme+="

Update at $(date +'%d/%m/%Y')"

#And now we update the readme file
echo "$readme" > README.md