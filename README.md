peopleviewer
============

An Exhibit Based People Viewer

##1. Preamble
The following files are part of the Exhibit based People Viewer, which has been developed for the MLODE 2012 Conference (http://sabre2012.infai.org/mlode) to visualize the conference attendees. 
It enables faceted search and exploration of a collaboratively edited Google Spreadsheet. The initial design and code was created Johannes Frey .
Note that there are different branches for stable deployments for MLODE, DBpedia(planned) and OWLG(planned)
For deployed examples you can look here: 

1. MLODE 2012: http://mlode.nlp2rdf.org/peopleviewer/mlode2012.html

##2. Files overview
* csv_to_tsv.py 		-- python script to convert a comma separated file into a tab separated file
* update_data_csv.sh	-- shell script to fetch data from a Google spreadsheet and convert into a local exhibit json data file
* people.html			-- exhibit presentation configuration file for displaying the json data file

##3. How it works
You can use a Google Spreadsheet to describe some subjects like persons with properties and associated values. 
This spreadsheet gets converted by the google api to a csv file and is fetched by the update script. 
Then the little python script is used to convert it into a tsv file. 
Afterwards the babel translator is used by the update script to convert the tsv file into a exhibit json file.
Finally the translated json file is stored in a local directory of your webserver. 
Now you can display the people.html file on your webserver.

###Why are there so many steps?
Actually Exhibit is able to import spreadsheets directly. But since Google changed its API it doesn't work anymore.
Babel also supports xls support for creating json files. But the Google API had some problems with exporting valid xls files.

##4. Local Deployment

###4.1 Requirements
* unix webserver
* unix tools wget, cat, curl
* python greater than 2.3

###4.2 Test with example configuration
Just copy the files to any directory of your webserver and change to that directory. 
Make the update_data_csv.sh executable and run it (chmod u+x update_data_csv.sh).
Now you should see the new people.json file. If not have a look at the console output to check what the problem is. 
If you're sure you met all the requirements, probably the Google spreadsheet has been deleted or Google API or the Babel API changed. 
Try to run each step manually to find out more.

###4.3 Personal Configuration
1. Create a new google spreadsheet. The spreadsheet should have the following structure: Each row represents a subject except the table header. 
Each subject has some properties with associated values. Each column is used for a property. The first row of the table defines the names of 
the properties. If there are more than one value per property separate them with ";". 
You can have a look at [1] and [2] for more information and see the example spreadsheet.

2. Edit the variables at the beginning of the "update_data_csv.sh" script
Change the url to the Spreadsheets URL in  by replacing https://docs.google.com/spreadsheet/ccc?key=0Akvj-QyYXjmcdDVmNE9GZkpkZGVHMkZ3bmsyUTBGdnc with your personal file. 
NOTE the URL should look like in the example above. Watch out that there is no hash tag at the end of the URL.	
Secondly edit the "PEOPLEVIEWERPATH" and change the path to the folder the scripts are in. 

3. Change the presentation by modifying the Exhibit Expressions in the presentation.html file. 
Have a look [3] to learn the basics about Exhibit. On [4] there is a detailed documentation on how to change the settings and parameters for different views.
	
4. (optional) for automatic loading add a cronjob

5. Adjust people.html in whichever way you need it. 

##5. Licence
Copyright 2012 AKSW

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

		
##6. References

[1]	http://simile-widgets.org/wiki/How_to_make_an_exhibit_from_data_fed_directly_from_a_Google_Spreadsheet#Formatting_the_Data

[2]	http://simile-widgets.org/wiki/How_to_make_an_exhibit_from_data_fed_directly_from_a_Google_Spreadsheet#Dates_in_Google_Spreadsheets

[3]	http://simile-widgets.org/wiki/Exhibit

[4]	http://simile-widgets.org/wiki/Reference_Documentation_for_Exhibit


