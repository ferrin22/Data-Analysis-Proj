#---
#title: "Skeleton"
#author: "Michael Ferrin"
#date: "December 8, 2015"
#---
#Skeleton file that serves two purposes:
#   1) Creates all the directories for our project
#   2) Runs our data cleaning code, 'DataCleaning.R'
#      which cleans our raw data and stores the clean
#      output in 'data/total.csv'

dir.create("code")
dir.create("rawdata")
dir.create("data")
dir.create("resources")
dir.create("report")
dir.create("images")

#Note regarding downloading raw data
#We were unable to download our raw data directly from R because the Rivals.com database couldn't be accessed directly through a URL.
#The information had to be queried first, so we manually saved the raw data into html files and stored them in our rawdata directory. 

#Run Data Cleaning Script
source('code/DataCleaning.R')
