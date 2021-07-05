# Notes from Dror's tutorial on scraping using command line

*These are notes from a [video tutorial by MA Data Journalism student Dror Kessler on using command line for scraping](https://web.microsoftstream.com/video/37dc6d89-0b66-49ce-946a-31ce9c55e91e). His GitHub folder for the tutorial can be found at https://github.com/dror27/dror-ddj-notebooks/tree/master/scraping.*

First, some command line basics:

Using `echo`: single quotes means show the value verbatim; double quotes means you can use special characters like `$` to indicate a variable.

Variables can be created as in Python, with an equals sign like this:

`myname=Paul`

()*Note that there should be no spaces either side of the equals sign, or you will get an error.*)

And then called by using the variable name prefixed by a dollar sign like so:

`echo "$myname"`

Create a file manually from inside command line with `cat >` followed by the name of the file including any file extension, e.g.

`cat > anewfile.txt`

After you press Enter, it will go to a new line where you are expected to write the contents of that file, pressing Enter for each new line until you've finished. To indicate that you've finished, type the end-of-file (EOF) character: `CTRL+D`

You can open a file using `cat` on its own, e.g.

`cat anewfile.txt`

And you can look at the first page using `less`:

`less anewfile.txt`

You can create a sequence of numbers using `seq` followed by the last number. For example to create a sequence from 1 to 500, type:

`seq 500`

And this can be stored in a file using `>` like so:

`seq 500 > nums1to500.txt`

## Fetching pages using `curl`

The `curl` command fetches a page from a specified URL. On its own it will display it in Terminal, but some extra commands can change that. For example:

`curl -s "http://bbc.co.uk" | wc`

The `-s` stops it showing details on progress/file size etc. ('silent').

The pipe symbol 'pipes' the results of that curl to the `wc` command to give us a word count of that file.

Likewise:

`curl -s "http://bbc.co.uk" | grep "News"`

This feeds the page into a grep command to find lines that contain that word.

## Drilling down into parts of a webpage using xpath in `xmllint`

A command like this acts like grep but using xpath instead:

`curl -s "http://bbc.co.uk" | xmllint --html --xpath "//script" -`

## Query JSON using `jq`

JQ can be used to query JSON and drill down into branches of it, e.g.

`curl -s "http://bbc.co.uk" | jq '.props.pageProps.initialState.searchData."LOCATION_PROPERTY_ALL_Birmingham".data`

it may need to be installed first: https://stedolan.github.io/jq/download/



See final results here: https://github.com/dror27/dror-ddj-notebooks/blob/master/scraping/completelyretail.co.uk/get_props.sh
