# Notes on using command line (Terminal on a Mac/Linux, PowerShell on Windows)

Command line is a way of navigating files on your computer, and doing things with them. In this repo I'll add notes about various useful techniques for journalists using the command line.

If you have a Mac or Linux-based machine, you can run command line from the **Terminal**. Most of the notes here are based on this approach (as I use a Mac). For Windows machines you can [use PowerShell](http://www.computerperformance.co.uk/windows7/windows7_powershell.htm) or type 'cmd' in the search box. You may need to search for the Windows version of the same command.

Because I use a Mac, the commands listed below and in this repo will normally work in Terminal. In some cases I've also listed the PowerShell equivalent. If you cannot find the PowerShell equivalent, [check this reference list of commands in both Unix and Windows](https://www.lemoda.net/windows/windows2unix/windows2unix.html), or search for the name of the command and 'equivalent in PowerShell'.

## Getting started: where am I?

We are used to navigating around the computer using physical world analogies: the 'desktop' is supposed represent the contents of the computer as an office desk with objects on it. 'Documents' might be kept inside 'folders', and so on. None of these things exist, of course - they are just metaphors. But we are so used to that way of navigating, that a simple black screen can be disorienting.

One of the most confusing things about using the command line, then, is knowing where you are and moving around without those familiar icons to help. Often you will need to navigate to a particular folder on your computer in order to use or create files there.

Some key commands in getting oriented are `pwd`, `ls` and `cd`.

A good first command to type the first time you open Terminal is:

`pwd`

This means 'present working directory' and will show you where you are in the computer. A typical result might be something like `/Users/yourname` but you might also get `/` which means the *root* directory on your machine (where everything is stored - think of it as the bottommost part of the computer, or the 'room' containing the desktop, filing cabinet and everything else).

Knowing where you *are* is useful, but it's even more useful to know where you can *go*. To find out all the folders and files in the current directory type:

`ls`

(or, on Windows: `dir`)

You should see a list appear. To change directory (move) into any folders listed type `cd` followed by the name of the directory. For example if your list contained 'Desktop' and 'Documents' you can move into the Desktop folder by typing:

`cd Desktop`

You can move more quickly by describing a path through multiple levels like so:

`cd Desktop/mystuff/myproject`

If you need to keep moving to get to where a file is, keep using `ls` and `cd` to see what folders there are and then move into one of them. Alternatively, you can leave command line, save your file somewhere you've already moved into, and then come back to command line to work with it!

To go *back* up one level use `..` with `cd` like so:

`cd ..`

## Finding out what commands do

To find out about a command like `ls` or `cd` you can use the *manual* - that is, `man` followed by the command (known as a *utility*) you want to find out about, like so:

`man cd`

## Combining files with `cat` (Linux/Mac) or `type` (Windows)

[More about that here](https://github.com/paulbradshaw/commandline/blob/master/joining.md)

## Moving files

[More about that here](https://github.com/paulbradshaw/commandline/blob/master/movingfiles.md)

Mina Demian has [written a little shell script here that does something similar too](https://gist.github.com/minademian/56fad650e759a14e0bfff9a6f988bc5a)

## Running shell scripts

The above file created by Mina Demian is a `.sh` file - that means it is a *shell script*. A shell script is a file which contains commands you might normally run in Terminal or PowerShell. If you wanted to run those commands more than once, it helps to be able to store it in a separate file. To identify it as a shell script, the first line is normally `#!/bin/bash`.

To run a shell script navigate to the folder containing it using `cd` (as detailed above) and then type `bash` *or* `sh` *or* `./` followed by the name of your .sh file, like so:

`bash myscript.sh`

Or:

`sh myscript.sh`

Or:

`./myscript.sh`

You can also save the results of running the script into a new file using `>` like so:

`bash myscript.sh > resultsofmyscript.txt`

For troubleshooting, [see this guide](https://askubuntu.com/questions/38661/how-do-i-run-sh-files). You can also find [a beginner's guide to the basics of shell programming here](https://www.howtogeek.com/67469/the-beginners-guide-to-shell-scripting-the-basics/) and [a more advanced guide to getting started with shell programming here](http://www.freeos.com/guides/lsst/ch02.html)

## The command line version of 'print'

You can get the command line to print things by using `echo`. For example:

`echo "Hello World"`

It's not that useful on its own, but can be incorporated into shell scripts as detailed above...

## Checking the first line(s) of a file (or files) with `head` or `Get-Content`

I've [written about that here](https://github.com/paulbradshaw/commandline/blob/master/head.md)

## Counting the number of rows, words or characters in a large file with `wc` or `Measure-Object`

I've [written about that here](https://github.com/paulbradshaw/commandline/blob/master/linecount.md)

## `curl`

`curl` is a very useful command for downloading files. Used on its own it will just show the contents of a URL within Terminal itself, but when combined with `-O` it will save the file at that URL to your computer. I've written some [tips and ideas for using curl here](https://github.com/paulbradshaw/commandline/blob/master/curlscraping.md)

## `wget` for downloading entire websites

[From MakeUseOf](https://www.makeuseof.com/tag/how-do-i-download-an-entire-website-for-offline-reading/)

> "Wget is a command-line utility that can retrieve all kinds of files over the HTTP and FTP protocols. Since websites are served through HTTP and most web media files are accessible through HTTP or FTP, this makes Wget an excellent tool for ripping websites."

## Converting or resizing multiple images using `sips`

The `sips` command line tool can resize images or convert from one format to another. You can [find a tutorial on resizing images here](https://lifehacker.com/5962420/batch-resize-images-quickly-in-the-os-x-terminal) or a [more extensive guide that covers conversion here](https://robservatory.com/use-sips-to-quickly-easily-and-freely-convert-image-files/)

## Converting Safari's '.webarchive' file format into separate HTML and image files using `textutil`

When you save a webpage in Safari it saves the whole thing as a special `.webarchive` file. However, this can't be easily scraped or searched. To convert it to a HTML file you can use the [instructions in this thread](https://apple.stackexchange.com/questions/123437/how-do-i-turn-a-safari-webarchive-file-into-a-folder) and code like this: `textutil -convert html YOURFILENAME.webarchive`

## Mass converting CSVs using `curl` with the PDFTables API and other APIs

The [PDFTables API](https://pdftables.com/pdf-to-excel-api) allows you to convert PDFs to CSV, Excel or XML files using `curl` in command line. [I've written a brief tutorial here](https://github.com/paulbradshaw/commandline/blob/master/pdfconversionapi.md).

## Working with CSVs

In [Bash ⋖3's CSVs: Data Analysis on the cmdline](https://www.youtube.com/watch?v=byEzXt2Ghsc) Nicholas Canzoneri walks through a data set and shows "examples of the best utility to use in different situations." including `grep` and `cut`, `comm` and `tr`.

## Redacting documents before publication

This is a great one: [CryptoAustralia walk you through using command line to scrub documents of metadata that might compromise sources](https://blog.cryptoaustralia.org.au/2017/05/02/secure-comms-for-journalists/)

## Places to practise command line

There are a number of ways you can practise command line, outside of your own computer. [Codecademy has an interactive course on command line](https://www.codecademy.com/en/courses/learn-the-command-line/lessons/navigation/exercises/your-first-command), for example.

### Try.Jupyter

The [Try Jupyter!](https://try.jupyter.org/) option at try.jupyter.org is an online environment that creates a temporary way "to try out a recent development version of the IPython/Jupyter notebook." One nice feature of Try Jupyter is that it allows you to work in a Terminal too. To launch one, click on **New** in the right corner, and select **Terminal**. This will open up a big black box where you can type commands just like on a computer's Terminal. The first command to try is:

`ls`

This will list the files and folders in the current directory - and you should see the same list that you saw on the main try.jupyter.org page.

## Other command line links and ideas

* I [maintain a list of command line-related links in my Pinboard bookmarks tagged 'commandline'](https://pinboard.in/u:paulbradshaw/t:commandline/)
* [8 Useful Shell Commands For Data Science](https://www.datacamp.com/community/tutorials/shell-commands-data-scientist)
* [Working with CSVs on the command line](http://bconnelly.net/working-with-csvs-on-the-command-line/)
* [Chrome and Firefox Can Take Screenshots of Sites From the Command Line](https://www.bleepingcomputer.com/news/software/chrome-and-firefox-can-take-screenshots-of-sites-from-the-command-line/)
