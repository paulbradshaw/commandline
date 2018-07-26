# Command line in practice: backing up Audioboom files

In October 2017 the audio hosting service Audioboom announced it was going to end free accounts. This meant that anyone choosing not to pay $9.99 per month would have to download all their audio in order to publish it elsewhere.

Here's how to use a range of command line techniques to do that - not just for your own account, but any person's account (another use case here would be that you want to keep a personal archive of someone's audio or images or video in case they delete them).

First, break down the problem:

1. Identify a place we can find the URLs of all the files we need to download
2. Identify the pattern that all URLs share
3. Extract a list of those URLs by recognising that pattern
4. Download the file at each URL

## Where are the URLs?

The audio pages are all linked from https://audioboom.com/Paulbradshaw. But you have to keep scrolling down to get the page to load each new batch of links. If you click on the [link to the RSS feed](https://audioboom.com/users/33562/posts.rss), however, you find that it contains *all* links to the mp3 files.

First I saved the page at that URL containing all those links, adding an `.xml` extension (RSS is an XML format, essentially), so I could work on it locally.

Next, I opened it in the text editing software **Atom**. This includes a powerful find and replace function that allows for **regex**

## Creating a list

To create the extra rows I used the following in the *find* box:

`.mp3`

And this in the *replace* box:

`.mp3\n="-o"\n`

In other words, replace `.mp3` with `.mp3`, followed by a new line (`\n`) then on that new line `="-o"`, then another new line (`\n`).

The results can be seen in the file `audioboomurls.txt`

## Adding names in Excel

We now have

`=IF(ISBLANK(A3),SUBSTITUTE(A1,"https://audioboom.com/posts/",""),A3)`

You can see the resulting file as `audioboom3line.txt` in this repo.
