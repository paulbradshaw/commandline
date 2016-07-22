# Notes on using command line within Terminal on a Mac

I'll add notes here about various techniques using the command line.

## cURL

cURL is a very useful command for downloading files. Used on its own it will just show the contents of a URL within Terminal itself, but when combined with `-O` it will save the file at that URL to your computer. 

`curl -O http://www.gov.scot/Resource/0049/00498327.pdf`

Will download the file to the current directory (cd)

`curl -O http://www.gov.scot/Resource/0049/00498327.pdf -O http://www.gov.scot/Resource/0049/00498328.pdf`

The key points:

* curl only appears once, at the start
* -O appears before each filename. That's a capital O btw, not a zero
* Then the filename. This only works where you have file extensions, it doesn't really work with webpages
* Then -O again, and the second filename, and so on

It all needs to be on the same line. The function JOIN in Google Sheets is good for generating the command you need to write (specify " -O " as a delimiter and it will put it between each URL).

* The directory is shown in Terminal at the start of the line after the name of the computer and a colon, e.g. `Pauls-Desktop-Air:Desktop` means it's on the Desktop. If it is just a slash e.g. `Pauls-Desktop-Air:/` then it's in the root directory.

To change the current directory type `cd` followed by the name of the folder (in this directory) you want to move into.

Of course, how do you know what folders are in this directory?! Type `ls` (that's an L) and it will list the folders.

## Example of live scraping using cURL

Tony Hirst has [an example of using cURL to scrape live F1 timings here](https://blog.ouseful.info/2016/07/18/simple-live-timing-data-scraper/)

The code is:

`mkdir f1_silverstone i=1; sleep 900; while true ; do curl http://www.livesportstreaming24.com/live.php >> f1_silverstone/f1output_race_${i}.txt ;i=$((i+1)); sleep 5 ; done`

This involves a number of elements which are worth breaking down:

* Making a new directory
* Creating a loop which will repeat an action
* Specifying a time period for the process



