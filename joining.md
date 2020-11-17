# Joining files using command line (`cat`/`type`)

One of the most useful applications of command line is the ability to join multiple files (for example CSV files) using the command `cat` (in Linux/Mac) or `type` (in Windows).

First it's best to make sure all your CSV files are in the same folder, and you have no other CSV files in there as well.

Then open the command line utility (in Windows click on the Start button in the bottom left corner and type `cmd` or PowerShell; in Mac click on the magnifying glass in the top right and type *Terminal*).

And type:

`cat *.csv > allthedata.csv`

Or in Windows:

`type *.csv > allthedata.csv`

The asterisk is a wild card that means 'any characters', so it basically means take any file that ends in .csv and combine them all into a new file called allthedata.csv

You can be more specific, e.g.

`cat *street.csv`

The [Police crime archive](https://data.police.uk/data/archive/) data, for example uses 3 types of ending: street, outcomes, and stop-and-search.

## Exercise: combining stop and search data

First, go to the [Data.police.uk data downloads page](https://data.police.uk/data/) and select the last year of stop and search data for a particular police force. At the time of writing I selected data from June 2016 to May 2017, and made sure I ticked 'stop and search data' at the bottom.

This will download as a zip file. Unzip it - you should now have a folder containing all the CSV files for that period: 12 further folders, each with 3 files in it (outcomes, stop and search, and crimes). So, 36 CSVs total.

To make things easier for yourself, rename the folder containing all these files (otherwise it has a crazy name like '4768f3ec2965fe1c3a694bdedbe7d82a4bef11c1'). I've called it *tocombine*.

Then move it somewhere you can easily get to, like Documents or Desktop.

Now open up Terminal, and type:

`ls`

This will list the folders in the current directory. Hopefully one of those should be *Desktop* and another *Documents*. I've put my folder in Desktop, so I need to go there. To do that:

`cd Desktop`

Now to move into the folder we created:

`cd tocombine`

Unfortunately all the files we want to combine are in separate folders. [There is a way to automatically extract them and put them in one](https://github.com/paulbradshaw/commandline/blob/master/movingfiles.md) - but if you don't want to do that as well, just do that manually for the stop and search data.

Right. You should now have 12 CSV files together in that folder. Now type

`cat *.csv > stopandsearch12month.csv`

You should now have a new file in the same folder with that name, ready to be analysed.

## More advanced options

MA Data Journalism student Niels de Hoog suggested this code to grab CSV files from within their folders, so you don't have to move them manually:

`find . -name "*.csv" -exec cat > all_data.csv {} +`

Fellow student Dror Kessler adds this code to move the CSV files using command line instead (so they can then be combined using `cat`):

`$ mv */* .`
