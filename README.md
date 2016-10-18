# Archive-and-Compress-Files


This is a bash program.

The program can archive as well as compress  all the files from the previous directory to the deatination directory, by following the requirements that users input

  archive [−s size] [−t dir1] [−d dir2] < ext_list >   where dir1 and dir2 are two valid directories.

  Note that an argument between [ and ] is optional while an argument between < and > is not.
  
   The script archive moves all files in target directory dir1 (or current directory if this argu- ment is omitted), with     extensions in < ext_list >, into destination directory dir2. If the latter is omitted, then create a subdirectory in the target directory called myArchive. When size option is present, only files exceeding it are concerned by the move.
Then, archive all moved files using the tar utility to create a single file, called myArchive.tar. You should have only myArchive.tar in your destination directory, if necessary, delete original files.

Call example:
   archive -s 1000 -d ∼/oldFiles/ pdf doc exe
   
In this case, move all files, exceeding 1000 bytes, with extensions pdf, doc or exe, from my cur- rent directory to ∼/oldFiles/myArchive/ then, create a myArchive.tar and remove the moved files.

# Language: 
bash
