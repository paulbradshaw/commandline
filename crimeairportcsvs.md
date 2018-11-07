# Using command line to filter dozes of CSV files to one that matches a criteria

We have downloaded 1.8GB of CSV files - spread across dozens of folders (you can see an example of these files in the 'data' folder of this repo, inside a folder called 'crimedata'). From those we want to extract any containing the word 'airport'. We need the following commands:

* `mv` to move the files into one place
* `grep` to search for patterns and grab the documents, lines or sentences containing them.

## Testing on one file

First we copy one of the files into a separate folder and in command line navigate to that file using `ls` (to see what directories are in the current directory) and `cd` (to change the current directory to one of those)

Then we try:

`grep ".*Airport.*" *.csv > airportsonly.csv`

This looks for any lines that match the regular expression (any or no characters followed by 'Airport' followed by any or no characters). Any lines that match are put in a new file, 'airportsonly.csv'

This works, so we then copy a whole folder of CSVs - one for each force in a particular month - move there (using `cd`) and repeat the same command. The `*.csv` part means it operates on all CSV files in that directory.

## Testing on multiple folders

This code locates any matching files and copies them to the 'moved' folder.

```
mv `find $HOME/Desktop/airportcrimes/crimesarchive201805 -name "*street.csv"` $HOME/Desktop/airportcrimes/moved
```

Once this is done, move into the directory using `cd` and run the same command as above. Only this time you're working across over 1600 files...

`grep ".*Airport.*" *.csv > airportsonly.csv`

## A version for bicycle theft

Adapting this process for 'Bicycle theft' you can try:

`grep ".*cycle.*" *.csv > crimegrep.csv`

To find the locations of all files, and store a list of the results in a new file, you can try:

`find /Users/paul/Documents/GitHub/commandline/data/crimedata/2018-07 -name "*street.csv" > filelist.txt`

You can then use that list as the basis for a `mv` command ([detailed here](https://unix.stackexchange.com/questions/115734/move-file-by-list-in-file-with-leading-whitespace))

`cat filelist.txt | xargs mv -t /moved`



That can be nested in a `mv` command like so:

```
find ~/Users/paul/Documents/GitHub/commandline/data/crimedata/2018-07 -name "*street.csv" mv '{}' ~/Users/paul/Documents/GitHub/commandline/data/crimedata/moved \;
```
