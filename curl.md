# cURL

`curl -O http://www.gov.scot/Resource/0049/00498327.pdf`

Will download the file to the current directory (cd)

`curl -O http://www.gov.scot/Resource/0049/00498327.pdf -O http://www.gov.scot/Resource/0049/00498328.pdf`

The key points:

* curl only appears once, at the start
* -O appears before each filename. That's a capital O btw, not a zero
* Then the filename. This only works where you have file extensions, it doesn't really work with webpages
* Then -O again, and the second filename, and so on

It all needs to be on the same line. The function JOIN in Google Sheets is good for this, and you can add " -O " as a delimiter.

It all needs to be on the same line. The function JOIN in Google Sheets is good for this, and you can add " -O " as a delimiter.

* The directory is shown in Terminal at the start of the line after the name of the computer and a colon, e.g. Pauls-Desktop-Air:Desktop means it's on the Desktop. If it is just a slash e.g. Pauls-Desktop-/ then it's in the root directory.

To change the current directory type cd followed by the name of the folder (in this directory) you want to move into.

Of course, how do you know what folders are in this directory?! Type ls (that's an L) and it will list the folders.
