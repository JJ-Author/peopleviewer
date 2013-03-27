wget -O /var/www/exhibit/people.csv "https://docs.google.com/spreadsheet/ccc?key=0Akvj-QyYXjmcdDVmNE9GZkpkZGVHMkZ3bmsyUTBGdnc&output=csv"
cat /var/www/exhibit/people.csv | python /var/www/exhibit/csv_to_tsv.py > /var/www/exhibit/people.tsv
curl --form upload=@/var/www/exhibit/people.tsv "http://service.simile-widgets.org/babel/translator?reader=tsv&writer=exhibit-json&mimetype=default" > /var/www/exhibit/people.json
