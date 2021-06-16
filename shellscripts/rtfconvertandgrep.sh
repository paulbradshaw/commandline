echo "converting rtf files to rtf"
textutil -convert txt *.RTF
echo "removing rtf files"
rm *.RTF
echo "making directory for txt files"
mkdir txtfiles
echo "moving txt files into new directory"
mv *.txt txtfiles
echo "grepping mentions of different words"
grep "black" txtfiles/*.txt > mentionsblack.txt
grep "white" txtfiles/*.txt > mentionswhite.txt
grep "asian" txtfiles/*.txt > mentionsasian.txt
grep "ietnamese" txtfiles/*.txt > mentionsviet.txt
