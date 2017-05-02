# Using command line to see the first line(s) of a file (or files)

If you have a very large file on your computer which cannot be easily opened with conventional software - or you want to check a number of files, the `head` command can be a quicker way of doing this.

## Default: showing the first 10 lines

`head` will show you the first 10 lines of any specified file or files - but you can also specify a different number. A typical command looks like this:

```
head myfile.csv
```

The file 'myfile.csv' must be in the same directory as you are when you write the command (to find out what directory you are in, and move, [see the instructions here](https://github.com/paulbradshaw/commandline)). Or you can specify a path like so:

```
head somefolder/myfile.csv
```

You can show the first lines of multiple files by listing them all like so:

```
head myfile1.csv myfile2.csv
```

And if they are all the same type, you can use an asterisk wildcard instead like so:

```
head *.csv
```

If you are doing this, it's a good idea to create a specific folder just for this task, and put all your files in there.

## Showing a different number of files with `head`

10 lines is just the default. You can specify a different number of lines using `-n` followed by the number of lines you want, like so:

```
head -n1 myfile.csv
```

This returns the first line (1 line) in that file - with a spreadsheet, this is a useful way of just seeing the headings.

You can actually write this in a number of ways, with a space: 

```
head -n 1 myfile.csv
```

Or without `n` at all:

```
head -1 myfile.csv
```

## Storing the results in a new file

Until now these commands have only *printed* (displayed) the results in the place where you are typing command line. But you will probably want to store them in a new file to study or analyse them further. To do that add the `>` command follwed by the name of the new file that you want to create, like so:

```
head -n1 myfile.csv > myheaders.csv
```

This new file will be created in the same directory as you have been writing this code.
