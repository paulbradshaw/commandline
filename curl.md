# curl

`curl -O http://www.gov.scot/Resource/0049/00498327.pdf`

Will download the file to the current directory (cd)

`curl -O http://www.gov.scot/Resource/0049/00498327.pdf -O http://www.gov.scot/Resource/0049/00498328.pdf`

The key points:

* curl only appears once, at the start
* -O appears before each filename. That's a capital O btw, not a zero
* Then the filename. This only works where you have file extensions, it doesn't really work with webpages
* Then -O again, and the second filename, and so on

It all needs to be on the same line. The function `JOIN` in Google Sheets is good for this, and you can add " -O " as a delimiter.

* The directory is shown in Terminal at the start of the line after the name of the computer and a colon, e.g. `Pauls-Desktop-Air:Desktop` means it's on the Desktop. If it is just a slash e.g. `Pauls-Desktop-/` then it's in the root directory.

To change the current directory type `cd` followed by the name of the folder (in this directory) you want to move into.

Of course, how do you know what folders are in this directory?! Type `ls` (that's an L) and it will list the folders.

## Downloading a sequential range of pages

Many sites - from blogs to job ad sites - use page numbering to order pages. Here's an example of the URL you get when you click on the 'Older' link at the bottom of the home page of my Tumblr blog:

`https://paulbradshaw.tumblr.com/page/2`

Not surprisingly, you can access any other page in the archive by simply changing that number.

This is a perfect opportunity to demonstrate a simple scraping technique using `curl`.

To grab a range of pages rather than one, put the range in square brackets like so. In this case we're just going to grab eight:

`https://paulbradshaw.tumblr.com/page/[1-8]`

And put the whole thing in quotation marks to make a string:

`"https://paulbradshaw.tumblr.com/page/[1-8]"`

Then insert that into your `cURL` command:

`curl "https://paulbradshaw.tumblr.com/page/[1-8]"`

This command will download all 8 files directly into Terminal/PowerShell - but we want to store those in 8 files instead. To do that, we can use `-o` (that's a lower case 'O' for 'output').

`-o` [allows you to specify the name](https://curl.haxx.se/docs/manpage.html#-o) of the file it's going to be saved in. Adding that makes our command look like this:

`curl "https://paulbradshaw.tumblr.com/page/[1-8]" -o`

Now we need to specify the name of the file - but we're going to have 8, not just one. To accommodate that, we're going to use the hash operator, `#` like so:

`curl "https://paulbradshaw.tumblr.com/page/[1-8]" -o "#1.html"`

The `"#1.html"` at the end is a placeholder - for each number (#1) in the range, that number will be added to `.html` to create the file name. Obviously if you were grabbing sequentially numbered PDF files, .txt files, .jpg images, .xls files or some other file format, you would use that extension instead.

So now you have your command in full - try it:

`curl "https://paulbradshaw.tumblr.com/page/[1-8]" -o "#1.html"`

Note that the script will only grab the HTML files - any images, video, audio, external scripts, etc. will not be grabbed. However, the links to those images will be in the HTML, so it may *appear* as if images are still working. They will - but only with an internet connection, and *only as long as those images are online*. So if you want to capture the images as well, you will need to do so separately (for example, you could use command line to find every mention of .jpg in those files, then use curl to grab those).

## Slowing down the scraper

If you're doing this with a lot of pages, it's a good idea to slow down the rate at which the files are grabbed, for two reasons in particular: firstly, putting too large a burden on a server will slow down its performance, which isn't good for that business or its users; secondly, your script might be blocked.

You can slow the script down by specifying a per-second limit on the amount of information gathered, using `--limit-rate`:

`curl "https://paulbradshaw.tumblr.com/page/[1-8]" -o "#1.html" --limit-rate 10k`

## Alphabetical ranges

Alphabetical ranges can be grabbed in the same way, like so:

`https://www.parliament.uk/mps-lords-and-offices/standards-and-interests/register-of-lords-interests/?letter=[A-Z]`

Or, with the code in full (I've changed it to A-E so only 5 pages are grabbed to test):

`curl "https://www.parliament.uk/mps-lords-and-offices/standards-and-interests/register-of-lords-interests/?letter=[A-E]" -o "#1.html"`

## 'Stepped' ranges (every third, tenth, fifth, etc.)

You can specify that you don't want every number in a range by adding the 'step' after a colon like so: `[1-100:10]`.

Here, for example, we grab every 10th number from 1 to 80 (1, 11, 21, and so on):

`curl "https://paulbradshaw.tumblr.com/page/[1-80:10]" -o "#1.html" --limit-rate 10k`

You can [find more options and examples in this documentation](https://curl.haxx.se/docs/manpage.html), which also offers a [link to a free PDF book](https://www.gitbook.com/download/pdf/book/bagder/everything-curl). The site also explains `libcurl`, which is a library that can be used outside of command line in more general programming.

## Fetching URLs from a scraped list

You might have scraped a list of URLs from a webpage, and want to use cURL to loop through those URLs and download each one. 

You probably scraped the URLs as one column in a CSV file, so the first step is to copy that column on its own into a new file, without the header row. 

Copy the column of URLs (minus the header) into a text file, calling it 'urls.txt' so that it will work with the code below.

Make sure that file is in the location where you want to download the files to, then navigate to that location in command line and run this code:

`xargs -n 1 curl -O < urls.txt`

(The code comes from [this thread](https://unix.stackexchange.com/questions/281991/pass-a-list-of-urls-contained-in-a-file-to-curl))
