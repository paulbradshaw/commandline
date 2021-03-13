echo "code from https://osxdaily.com/2017/05/12/change-all-file-extensions-command-line/" 
echo "this will change files, not make copies"
for file in *.md; do mv "$file" "${file%.md}.txt"; done
echo "done"
