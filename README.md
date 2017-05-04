# Notes on using command line within Terminal on a Mac

Command line is a way of navigating files on your computer, and doing things with them. In this repo I'll add notes about various useful techniques for journalists using the command line.

If you have a Mac or Linux-based machine, you can run command line from the **Terminal**. Most of the notes here are based on this approach (as I use a Mac). For Windows machines you can [use PowerShell](http://www.computerperformance.co.uk/windows7/windows7_powershell.htm) or type 'cmd' in the search box. You may need to search for the Windows version of the same command.

## Getting started: where am I?

One of the most confusing things about using the command line is knowing where you are and moving around. Often you will need to navigate to a particular folder on your computer in order to use or create files there. Some key commands in getting oriented are `pwd`, `ls` and `cd`.

A good first command to type the first time you open Terminal is:

`pwd`

This means 'present working directory' and will show you where you are in the computer. A typical result might be something like `/Users/yourname` but you might also get `/` which means the root directory on your machine.

Knowing where you *are* is useful, but it's even more useful to know where you can *go*. To find out all the folders and files in the current directory type:

`ls`

(or, on Windows: `dir`)

You should see a list appear. To change directory into any folders listed type `cd` followed by the name of the directory. For example if your list contained 'Desktop' and 'Documents' you can move into the desktop folder by typing:

`cd Desktop`

If you need to keep moving to get to where your file was, keep using `ls` and `cd` to see what folders there are and then move into one of them. Alternatively, you can just go back to your Python file and save it somewhere you've already moved into!

## Combining files with `cat` (Linux/Mac) or `type` (Windows)

[More about that here](https://github.com/paulbradshaw/commandline/blob/master/joining.md)

## Checking the first line(s) of a file (or files) with `head` or `Get-Content`

I've [written about that here](https://github.com/paulbradshaw/commandline/blob/master/head.md)

## Counting the number of rows, words or characters in a large file with `wc` or `Measure-Object`

I've [written about that here](https://github.com/paulbradshaw/commandline/blob/master/linecount.md)

## `cURL`

cURL is a very useful command for downloading files. Used on its own it will just show the contents of a URL within Terminal itself, but when combined with `-O` it will save the file at that URL to your computer. I've written some [tips and ideas for using cURL here](https://github.com/paulbradshaw/commandline/blob/master/curlscraping.md)

## Mass converting CSVs using `curl` with the PDFTables API and other APIs

The [PDFTables API](https://pdftables.com/pdf-to-excel-api) allows you to convert PDFs to CSV, Excel or XML files using `curl` in command line. You will need to register with the site (for free) and can convert a limited number of PDFs per month with a free account (you can upgrade your account if you want to convert more).

The example code given is:

`curl -F f=@example.pdf "https://pdftables.com/api?key=YOURKEYWILLBESHOWNHERE&format=xlsx-single"`

You can adapt this code as follows:

1. First, make sure you are in the same directory as the PDF(s) that you want to convert, using `cd` as detailed above.
2. Adapt the code above so that `example.pdf` is replaced with the name of the PDF that you want to convert. Make sure that you include the `@` sign, otherwise it won't work
3. Change `YOURKEYWILLBESHOWNHERE` in the example above with your own key. As it happens, once logged in, your key will be shown in the example anyway. But it will also be higher in the page.
4. Change the `format=` parameter to the format you prefer. The `format=xlsx-single` will produce a single XLSX file, but you may prefer to choose `formar=csv`
5. As it stands this code won't actually create a new file - it will just display its contents in Terminal or PowerShell. So to make sure the converted PDF is actually stored in a new file, add `> mynewfile.csv` at the end (or whatever name you prefer). A new file will be created with that name in the same location.

For more than one file you can use wildcards to select them and a [for loop](https://www.cyberciti.biz/faq/linux-unix-bash-for-loop-one-line-command/) to create the resulting files.

## Places to practise command line

There are a number of ways you can practise command line, outside of your own computer. [Codecademy has an interactive course on command line](https://www.codecademy.com/en/courses/learn-the-command-line/lessons/navigation/exercises/your-first-command), for example.

### Try.Jupyter

The [Try Jupyter!](https://try.jupyter.org/) option at try.jupyter.org is an online environment that creates a temporary way "to try out a recent development version of the IPython/Jupyter notebook." One nice feature of Try Jupyter is that it allows you to work in a Terminal too. To launch one, click on **New** in the right corner, and select **Terminal**. This will open up a big black box where you can type commands just like on a computer's Terminal. The first command to try is: 

`ls`

This will list the files and folders in the current directory - and you should see the same list that you saw on the main try.jupyter.org page. 
