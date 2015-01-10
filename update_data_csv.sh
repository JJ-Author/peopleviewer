#!/bin/sh

#NOTE the URL should look like in the example. Watch out that there is no hash tag at the end of the URL.	
GSPREADSHEETURL="https://docs.google.com/spreadsheet/ccc?key=1XtgLLAekZfPTpEg0NB7pGUVaPUIQ8MobaRkK7aQmimY"
# absolute path is necessary for cronjob
PEOPLEVIEWERPATH="/home/swp14-sfm/git/peopleviewer"

# switch path
cd $PEOPLEVIEWERPATH
# download GDoc data & convert
wget -O people.csv "$GSPREADSHEETURL&output=csv"
cat people.csv | python csv_to_tsv.py > people.tsv
curl --form upload=@people.tsv "http://service.simile-widgets.org/babel/translator?reader=tsv&writer=exhibit-json&mimetype=default" > people.json
