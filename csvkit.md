# csvkit

**csvkit** is a set of tools you can use in your command line to convert, interrogate and create CSV files (spreadsheets). 

You can [find the documentation online here](http://csvkit.readthedocs.io/en/540/) but first you need to install it, using this line in Terminal:

`pip install csvkit`

One of the most powerful elements of csvkit is its ability to run **SQL queries** on CSV files [using csvsql and sql2csv](http://csvkit.readthedocs.io/en/540/tutorial/3_power_tools.html#csvsql-and-sql2csv-ultimate-power)

You can also use its `csvgrep` command to [filter large CSV files to create smaller more manageable ones](https://csvkit.readthedocs.io/en/1.0.2/scripts/csvgrep.html)

Here for example I've written a command which filters a file called 'allfiles.csv' to only show results where the first column contains the date 03-01 (March 1):

`csvgrep -c 1 -r "[0-9][0-9][0-9][0-9]-03-01" allfiles.csv > march1.csv`

* The `-c 1` says look in column 1.
* The `-r` indicates that we are about to describe a pattern using regex
* `"[0-9][0-9][0-9][0-9]-03-01"` is the regex: it means any four digits (the year) followed by -03-01.
* Next comes the name of the file to be filtered
* Finally we put the results into a new file with `> march1.csv`
