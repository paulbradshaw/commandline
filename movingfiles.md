# Moving files

## Exercise: combining stop and search data

First, go to the [Data.police.uk data downloads page](https://data.police.uk/data/) and select the last year of stop and search data for a particular police force. At the time of writing I selected data from June 2016 to May 2017, and made sure I ticked 'stop and search data' at the bottom.

This will download as a zip file. Unzip it - you should now have a folder containing all the CSV files for that period: 12 further folders, each with 3 files in it (outcomes, stop and search, and crimes). So, 36 CSVs total. We want to find those and move them to just one folder so we can then combine them.

To make things easier for yourself, move the folder somewhere you can easily see, like Desktop.

Now, also on the Desktop, create a new folder which will hold the files you find. Call it 'foundfiles'

Now here is the sort of command you are going to type - I'll break it down in a moment as it has a number of different parts:

```
mv `find ~YOURCOMPUTERNAME/Desktop -name "*street.csv"` ~YOURCOMPUTERNAME/Desktop/foundfiles
```

## Moving files with `mv`

The first part is `mv`: this is the 'move' command. You can [read more about that, and the related `cp`, 'copy' command, here](http://www.macworld.com/article/2080814/master-the-command-line-copying-and-moving-files.html).

When using this command you need to specify *what* you are moving, and *where*. For example:

`mv myfile.txt myfolder`

This will move myfile.txt into the folder called 'myfolder'. Note that the destination folder must exist first - it will not create a new folder.

You can also use wildcards like so:

`mv *.txt myfolder`

This will move *any* files ending in '.txt' into that myfolder.

Try this out yourself: create a folder called 'myfolder' and a text file called 'myfile.txt', then use command line to navigate into the same place as that text file (use `cd` to change directory) and then type one of the commands above.

At a basic level `mv` is limited in only being able to move files it can see in the current directory. However, we can use another command to solve that problem: `find`

## Finding files with `find`

`find` does exactly that: find files that match a description. This time you need to specify *where* you are looking, *what* it is that you are looking *at*, and what you are looking *for*. For example:

`find ~YOURCOMPUTERNAME/Desktop -name "*.txt"`

Here there are three ingredients after the initial `find` command:

* A path: `~YOURCOMPUTERNAME/Desktop`
* A property: `-name`
* A description: `"*.txt"`

The path starts with `~` which means the home directory (you can also use `$HOME` instead). After that comes the name of your particular computer - it might be 'Brian' or 'My Computer'. And then, after a slash, the directory within that which you want to search.

The property is `-name` but you could also choose to use `-size` to search by file size, or `iname` to conduct a name-based search which is not case sensitive.

The description is `*.txt` - the `*` is a wildcard which means 'none or more of any character', so as a whole it means 'none or more of any character, followed by .txt'

Taken together, the three elements mean 'find within the ~YOURCOMPUTERNAME/Desktop path, any files with a *name* which is none or more of any character, followed by .txt'

This will generate a list within Terminal. But we want to use the results within our `find` command instead.

## Nesting the `find` results to form the basis of a `mv` command

To use the results of that `find` command, we need to put the whole thing within a special character: you can see that character below just before `find`, and after `"*street.csv"`:

```
mv `find ~YOURCOMPUTERNAME/Desktop -name "*street.csv"` ~YOURCOMPUTERNAME/Desktop/foundfiles
```

This is taken by `mv` to describe the files that need to be moved. The second part, then, just describes where to move it to.

Try that. You should now have 12 CSV files together in that folder. 
