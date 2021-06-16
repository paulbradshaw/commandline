echo "converting rtf files to rtf"
textutil -convert txt *.RTF
echo "removing rtf files"
rm *.RTF
echo "making directory for txt files"
mkdir txtfiles
echo "moving txt files into new directory"
mv *.txt txtfiles
echo "grepping mentions of different words"
grep -i "black" txtfiles/*.txt > mentionsblack.txt
grep -i "white" txtfiles/*.txt > mentionswhite.txt
grep -i "Asian" txtfiles/*.txt > mentionsasian.txt
grep -i "vietnamese" txtfiles/*.txt > mentionsviet.txt
grep -i "described as" txtfiles/*.txt > mentionsdesc.txt
