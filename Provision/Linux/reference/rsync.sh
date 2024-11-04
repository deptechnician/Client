
# ---------------------------------------------------------------
# Rsync (for backup) reference
# ---------------------------------------------------------------
# synchronize the contents of Directory1 to Directory2, and leave no differences between the two. 
# If rsync finds that Directory2 has a file that Directory1 does not, it will delete it. 
# If rsync finds a file that has been changed, created, or deleted in Directory1, it will reflect those same changes to Directory2. 
rsync -avzP --delete /Directory1/ /Directory2/

rsync [OPTION...] SRC... [DEST]

rsync -avP --delete -e ssh /Directory1/ geek@192.168.235.137:/Directory2/
rsync -avzP --delete seth@scratch3.local:~/Images/ ./

Options Explained
-a: Archive mode
    This option enables several options that preserve the structure and attributes of the files being transferred. Specifically, it combines the following options:
    -r: Recursively copy directories.
    -l: Copy symlinks as symlinks.
    -p: Preserve permissions.
    -t: Preserve modification times.
    -g: Preserve group ownership.
    -o: Preserve owner (requires superuser privileges).
    -D: Preserve device and special files.

-v: Verbose
    This option makes rsync provide detailed information about what is being transferred, displaying the progress of the file transfer in the terminal.

-z: Compress during transfer
    This option compresses the data during transfer, which can speed up the transfer over slower networks. It can be particularly useful for large files or many small files.

-P: Partial and progress
    This option is equivalent to using --partial and --progress:
    --partial: Keeps partially transferred files, so if the transfer is interrupted, rsync can resume from where it left off instead of starting over.
    --progress: Shows the progress of the file transfers.

--delete:
    This option deletes files in the destination directory that are not present in the source directory. It ensures that the destination is an exact mirror of the source. Be cautious when using this option, as it will permanently remove files from the destination that do not exist in the source.
