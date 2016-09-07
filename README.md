# Notes on using command line within Terminal on a Mac

I'll add notes here about various techniques using the command line.

## Getting started: where am I?

One of the most confusing things about using the command line is knowing where you are and moving around. Often you will need to navigate to a particular folder on your computer in order to use or create files there. Some key commands in getting oriented are `pwd`, `ls` and `cd`.

A good first command to type the first time you open Terminal is:

`pwd`

This means 'present working directory' and will show you where you are in the computer. A typical result might be something like `/Users/yourname` but you might also get `/` which means the root directory on your machine.

Knowing where you *are* is useful, but it's even more useful to know where you can *go*. To find out all the folders and files in the current directory type:

`ls`

You should see a list appear. To change directory into any folders listed type `cd` followed by the name of the directory. For example if your list contained 'Desktop' and 'Documents' you can move into the desktop folder by typing:

`cd Desktop`

If you need to keep moving to get to where your file was, keep using `ls` and `cd` to see what folders there are and then move into one of them. Alternatively, you can just go back to your Python file and save it somewhere you've already moved into!

## cURL

cURL is a very useful command for downloading files. Used on its own it will just show the contents of a URL within Terminal itself, but when combined with `-O` it will save the file at that URL to your computer. I've written some [tips and ideas for using cURL here](https://github.com/paulbradshaw/commandline/blob/master/curlscraping.md)
