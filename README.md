Predicting College Football Success from High School Statistics



ABOUT:
	Fall 2015
	University of California, Berkeley
	Statistics 133 - Concepts in Computing with Data, Final Project

	How accurate is college recruiting information?  Do 5-star recruits actually outpreform those with 4 stars? Our project involves collecting recuriting data and comparing it against college football statics to determine whether high school football players actually live up to their hype. A more detailed reading of our experiment can be found under 'report/Report/Rmd'. Please see CITATIONS and STRUCTURE below to learn more about our project organization.



AUTHORS:
	Michael Ferrin
	Connor Gullstad
	Ritwik Roy
	Eric Arnett



CITATIONS/UNGENERATED FILES:
	High School Football Statistics Aquired From: 
		Rivals.com (http://sports.yahoo.com/ncaa/football/recruiting/recruit-search-results)
	College Football Statistics Aquired From: 
		ESPN.go.com (http://espn.go.com/college-football/statistics/player/_/stat/passing/sort/passingYards/year/2012)

	Data was aquired from these sites by saving the raw html files into the 'rawdata' file and parsing via through 'code/DataCleaning.Rmd'

		Raw Data   
		-------------------------------------------------------------------
	   | File (.html)    | Data                                            |
	   |-------------------------------------------------------------------|
	   | C1 - C12        | College Quarterback Statistics    - 2012 Season |
	   | r1 - r47        | College Reciever Statistics       - 2012 Season |
	   | U1 - U36        | College Running Back Statistics   - 2012 Season |
	   | Hqb1 - Hqb3     | High School Quarterback Rankings  - 2010 Season |
	   | Hrb4 - Hrb7     | High School Running Back Rankings - 2010 Season |
	   | Hwr8 - Hwr12    | High School Reciever Rankings     - 2010 Season |
	    -------------------------------------------------------------------



STRUCTURE:
	+FinalProject133 <------------ "Project Directory"
		-README.md
		-skeleton.R  <------------ "R script with the commands 
									to create the following 
									subdirectories"
		+resources
		+code
			-DataCleaning.Rmd <--- "Gathers our raw data, 
									contained in 'rawdata', 
									cleans it, and outputs our 
									clean data to 'data/total.csv'"

			-Analysis.Rmd     <--- "Contains the bulk of our 
									analysis - generates plots 
									to be stored in 'images', 
									calculates means, STD's and more"
		+data                 
			-total.csv        <--- "Our cleaned dataset used 
									for analysis"
		+report
			-Report.Rmd       <--- "High level overview of the 
									project including hypothesis 
									and results"
									Includes an Rmd, the corresponding
									PDF as well as a more asthetic 
									PDF version that we created in
									google docs.

		+images               <--- "Contains the plots and graphs 
									generated during analysis"

		+rawdata              <--- "Contains 108 raw html files 
									taken from ESPN.com and Rivals.com"
			-C1.html
			...
			-C12.html
			-Hqb1.html
			...
			-Hwr12.html
			-r1.html
			...
			-r47.html
			-U1.html
			...
			-U36.html
