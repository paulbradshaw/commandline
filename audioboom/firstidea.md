# Command line in practice: backing up Audioboom files (the first idea)

In October 2017 the audio hosting service Audioboom announced it was going to end free accounts. This meant that anyone choosing not to pay $9.99 per month would have to download all their audio in order to publish it elsewhere.

Here's how to use a range of command line techniques to do that - not just for your own account, but any person's account (another use case here would be that you want to keep a personal archive of someone's audio or images or video in case they delete them).

First, break down the problem:

1. Identify a place we can find the URLs of all the files we need to download
2. Identify the pattern that all URLs share
3. Extract a list of those URLs by recognising that pattern
4. Download the file at each URL

## Where are the URLs?

The audio pages are all linked from https://audioboom.com/Paulbradshaw. First we download the webpage containing all those links, so we can work on it locally.

Now, we could just open it in a browser and select *File > Save as*, but we're going to download multiple pages so let's do it using command line:

`curl https://audioboom.com/Paulbradshaw -o audioboomhtml.txt`

The `curl` part grabs a URL, which comes next. The `-o` specifies the *output* of that, and `audioboomhtml.txt` is the name of the file we want to put it in.

### Solving the pagination problem

On the page we have to scroll down to see more audio clips, but how do we do that with automation? One trick is to try a form of pagination - and add `?page=2` to the end of the URL, like this:

`https://audioboom.com/Paulbradshaw?page=2`

That works. Now we're going to need to download a whole bunch of these first. Now I have 389 audio clips. Divided by 20 that makes 20 pages (20 * 20 = 400. 19 * 20 = 380).

You can generate that list of page numbers in square brackets like so:

`curl "https://audioboom.com/Paulbradshaw?page=[1-20]" -o "#1.html"`

At the end of that line we can also dynamically generate the filenames with a hash symbol.

## What pattern do all the URLs share?

If we click on any link to the audio pages, each one starts with `https://audioboom.com/posts/`. Here's one example:

`href="https://audioboom.com/posts/6375611-audioboom-s-new-t-cs-only-available-when-logging-in-on-web?t=0"`

We can test that pattern by going back to the main page https://audioboom.com/Paulbradshaw and right-clicking to view the source HTML. Using CTRL+F on that HTML and looking for `posts/` we get 100 matches - so this page links to 100 'post' pages.

There's another pattern too: each URL *ends* in `?t=0`

## Extract a list of URLs using `grep`

Now it's on our computer we can write some command line that extracts patterns in that file that match the URLs we're looking for. `grep` is what we need - and here's how to use it to do just that:

`grep "https://audioboom.com/posts/.*\?t=0" 1.html -o`

The `grep` command looks for a *regular expression*, and that comes next:

`"https://audioboom.com/posts/.*\?t=0"`

First, the regular expression is contained within quotation marks. We specify that we're looking for a pattern that begins with `/posts/`. After that we get fancy: the regular expression `.*` means 'any character' (the period) with the modifier 'none or more' (the asterisk). In other words, we're saying 'none or more of any character'.

Next comes `\?`. This means 'literally' (the backslash) a question mark (`?`). We have to add the backslash because a question mark normally means 'one or more', but when a backslash is added it tells the regex that we *literally* mean a question mark, not its special meaning in regex. The backslash, in regex jargon, *escapes* the question mark.

Finally, `t=0` looks for that match, because every URL ends in that.

Put together, this is what the regex `"https://audioboom.com/posts/.*\?t=0"` says:

* Look for a match for the pattern `https://audioboom.com/posts/`
* followed by *none or more of any characters* (`.*`)
* followed by *a question mark* (not its special meaning in regex) (`\?`)
* followed by `t=0`

Now, strictly speaking we should *escape* the slashes in `https://audioboom.com/posts/` too. That would look like this: `https:\/\/audioboom.com\/posts\/`. But it works anyway, so I won't overcomplicate things.

After the regular expression comes the name of the file that you want to search in, and `-o` to show the output.

At the moment the results are just displayed in Terminal or PowerShell. To save them to a file, we need to add `>` and a name for the file like so:

`grep "https://audioboom.com/posts/.*\?t=0" 1.html -o > audiolinks.txt`

### Checking the results

When you open the resulting file you notice a couple of things: firstly, there are only 40 lines here, and each URL is repeated twice. So that's only 20 links.

The reason for this is that there are 100 mentions of `/posts/` but they are actually just 20 links presented 5 times. Here's an example:

* `/posts/6375611/ratings`
* `https://audioboom.com/posts/6375611-audioboom-s-new-t-cs-only-available-when-logging-in-on-web?t=0`
* `https://audioboom.com/posts/6375611-audioboom-s-new-t-cs-only-available-when-logging-in-on-web?t=0`
* `https://audioboom.com/posts/6375611-audioboom-s-new-t-cs-only-available-when-logging-in-on-web/memberships/new?disable_on_success_redirect=true&show_new_playlist_dest_picker=true`
* `https://audioboom.com/posts/6375611-audioboom-s-new-t-cs-only-available-when-logging-in-on-web`

Because only two of those examples end in `?t=0` only those are grabbed by our regex.

We can remove those redundant links later.

## Repeating this for 20 HTML files

Find some [instructions for downloading multiple files from URLs listed in a text file](http://blog.gypsydave5.com/2016/02/04/xargs-and-curl/). Here's the example at that link:

`cat file-with-list-of-urls.txt | xargs -n 1 curl -LO`

Adapted for our example, it looks like this:

`cat audiolinks.txt | xargs -n 1 curl -LO`

That works in downloading the HTML files. But we need the MP3 versions.

## Changing URLs to add .mp3

One way would be to go into each of those newly downloaded HTML files and use the same technique to look for - and grab - any link after `rel='audio_src'>` (which is where the mp3 links are).

## Downloading the audio files

A bit of searching will [tell you](http://www.bridiestypingservices.com/how-to-download-from-audioboom/) that you can get an mp3 version of any post by adding ".mp3" to the end of the URL, so this:

> `https://audioboom.com/posts/1038352-how-to-download-boo-files-as-mp3s-fb`

Becomes this:

> `https://audioboom.com/posts/1038352-how-to-download-boo-files-as-mp3s-fb.mp3`
