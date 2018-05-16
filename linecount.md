# Counting words, lines and characters in command line: `wc` and `Measure-Object`

If you have a large data file and want to know how many rows it has, command line is a quick way to do that.

On Mac/Linux the relevant command is `wc` (think 'word count'); [on Windows PowerShell it is `Measure-Object`](https://technet.microsoft.com/en-us/library/ee176900.aspx)

Using `wc` is relatively easy: use other commands to navigate to the folder containing your file, then type `wc` followed by the filename, e.g. `wc myfile.csv`. You should get a result which shows lines, words and characters in that order.

## Measure-Object

This command is more complex, as it has to be combined with others. Here's an example:

`Get-Content yourfilename.csv | Measure-Object -Line`

This code first gets the content (make sure you have navigated to the folder containing that file), then runs `Measure-Content` and specifies that it wants to measure the lines.

[More in this tutorial](https://blogs.technet.microsoft.com/heyscriptingguy/2011/10/09/use-a-powershell-cmdlet-to-count-files-words-and-lines/)


