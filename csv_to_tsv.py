import sys,csv
for row in csv.reader(sys.stdin, delimiter=',', quotechar='"'):
  print "\t".join(row) 
