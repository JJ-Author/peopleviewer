#!/bin/sh

#NOTE the URL should look like in the example. Watch out that there is no hash tag at the end of the URL.	
GSPREADSHEETURL="https://docs.google.com/spreadsheet/ccc?key=0Akvj-QyYXjmcdDVmNE9GZkpkZGVHMkZ3bmsyUTBGdnc"
# absolute path is necessary for cronjob
PEOPLEVIEWERPATH="/var/www/mlode.nlp2rdf.org/peopleviewer"

# switch path
cd $PEOPLEVIEWERPATH
# download GDoc data & convert
wget -O people.csv "$GSPREADSHEETURL&output=csv"
cat people.csv | python csv_to_tsv.py > people.tsv
curl --form upload=@people.tsv "http://service.simile-widgets.org/babel/translator?reader=tsv&writer=exhibit-json&mimetype=default" > people.json
