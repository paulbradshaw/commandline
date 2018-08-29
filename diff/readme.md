# Using `diff`

The `diff` command will show you the differences between two files. You can combine it with the `>` operator to save the differences in a new file.

In this folder you will find two versions of a webpage:

* [Immigration rules as they were in 2016](https://web.archive.org/web/20161125024957/https://www.gov.uk/guidance/immigration-rules/immigration-rules-part-1-leave-to-enter-or-stay-in-the-uk)
* And the same rules [just under 2 years later, in 2018](https://web.archive.org/web/20180829152849/https://www.gov.uk/guidance/immigration-rules/immigration-rules-part-1-leave-to-enter-or-stay-in-the-uk) (I saved this to the Web Archive myself to make the two more consistent)

To see what the differences are, you just need to write the `diff` command followed by the two file names:

`diff imrules1_2016.htm imrules1_2018.html`

This will just show the results within Terminal. To save to a text file, add `>` and a name for the new file like so:

`diff imrules1_2016.htm imrules1_2018.html > differences.txt`

## Adding options for context

[You can add options](https://www.geeksforgeeks.org/diff-command-linux-examples/) to specify how the results are shown.

* `-c` will show the results in context
* `-u` will show the results in a unified manner

Try adding these with the v1.md and v2.md files in this folder:

`diff v1.md v2.md -c > 1v2.txt`

In this case the lines which are different are preceded by an exclamation mark to draw your attention.

`diff v1.md v2.md -u > 1v2.txt`

With this option a `+` and `-` sign is used in front of changed lines to indicate what is removed in the first named file and then what it is replaced by in the second.
