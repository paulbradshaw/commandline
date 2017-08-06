# cURL

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

This is a perfect opportunity to demonstrate a simple scraping technique using `cURL`.

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

The `"#1.html"` at the end is a placeholder - for each number (#1) in the range, that number will be added to `.html` to create the file name.

So now you have your command in full - try it:

`curl "https://paulbradshaw.tumblr.com/page/[1-8]" -o "#1.html"`

## Slowing down the scraper

If you're doing this with a lot of pages, it's a good idea to slow down the rate at which the files are grabbed, for two reasons in particular: firstly, putting too large a burden on a server will slow down its performance, which isn't good for that business or its users; secondly, your script might be blocked.

You can slow the script down by specifying a per-second limit on the amount of information gathered, using `--limit-rate`:

`curl "https://paulbradshaw.tumblr.com/page/[1-8]" -o "#1.html" --limit-rate 10k`
