# Mass converting CSVs using `curl` with the PDFTables API and other APIs

The [PDFTables API](https://pdftables.com/pdf-to-excel-api) allows you to convert PDFs to CSV, Excel or XML files using `curl` in command line. You will need to register with the site (for free) and can convert a limited number of PDFs per month with a free account (you can upgrade your account if you want to convert more).

The example code given is:

`curl -F f=@example.pdf "https://pdftables.com/api?key=YOURKEYWILLBESHOWNHERE&format=xlsx-single"`

You can adapt this code as follows:

1. First, make sure you are in the same directory as the PDF(s) that you want to convert, using `cd` as detailed above.
2. Adapt the code above so that `example.pdf` is replaced with the name of the PDF that you want to convert. Make sure that you include the `@` sign, otherwise it won't work
3. Change `YOURKEYWILLBESHOWNHERE` in the example above with your own key. As it happens, once logged in, your key will be shown in the example anyway. But it will also be higher in the page.
4. Change the `format=` parameter to the format you prefer. The `format=xlsx-single` will produce a single XLSX file, but you may prefer to choose `formar=csv`
5. As it stands this code won't actually create a new file - it will just display its contents in Terminal or PowerShell. So to make sure the converted PDF is actually stored in a new file, add `> mynewfile.csv` at the end (or whatever name you prefer). A new file will be created with that name in the same location.

For more than one file you can use wildcards to select them and a [for loop](https://www.cyberciti.biz/faq/linux-unix-bash-for-loop-one-line-command/) to create the resulting files.
