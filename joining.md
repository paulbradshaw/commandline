# Joining files using command line (cat/type)

One of the most useful applications of command line is the ability to join multiple files (for example CSV files) using the command cat (in Linux/Mac) or type (in PC).

First it's best to make sure all your CSV files are in the same folder, and you have no other CSV files in there as well.

Then type:

`cat *.csv > allthedata.csv`

Or in Windows:

`type *.csv > allthedata.csv`

The asterisk is a wild card that means 'any characters', so it basically means take any file that ends in .csv and combine them all into a new file called allthedata.csv

You can be more specific, e.g. 

`cat *street.csv`

The Police crime archive data, for example uses 3 types of ending: street, outcomes, and stop-and-search.
