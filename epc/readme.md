# Using command line to combine energy efficiency data

Data on energy efficiency certificates from the EPC website at https://epc.opendatacommunities.org/login presents a problem you might use command line to solve. The data consists of 340 folders each containing two CSV files.

An extra problem is that the CSV files all have the same names, so we can't simply move them to the same folder because they will overwrite each other.

Instead we need to *rename* each file *and* move or copy it to a single folder, so that they can then be combined. 

The bash script in this folder shows the code for doing that. 

Let’s break it down.

We set a variable at 0: `num=0; `

We begin a loop, calling each item in that loop ‘i’: `for i in` 

We loop through the results of a ‘find’ command. Specifically, that command finds all files in the directory ‘all-domestic-certificates’* with the name certificates.csv: `find all-domestic-certificates -name "certificates.csv"`; 

Now, what to do with each of the results? We copy that file (at this point i is a variable, and the dollar sign indicates that it is referring to a variable name): `do cp "$i" `

And we change the name to the current value of that variable ‘num’ (again, indicated as a variable by prefixing with a dollar sign). The ‘printf’ part formats it, and %04d means to four digits, which is why the resulting files have names like 0001 and 0344: `"$(printf '%04d' $num)`

We also add the file extension of the original filename: `.${i#*.}";`

Then we increase the value of the variable ‘num’ by one so it’s different for the next loop: `((num++)); done`


