Readme for for 'Getting and Cleaning Data' Course Project
=========================================================

Files provided in github repo:
-----------------------------

	+ README.md			Overview of files and their contents (this file)
	
	+ CodeBook.md		Describes the original data received and the process 
						followed to prepare the required tidy dataset 
					
	+ run_analysis.R	R script for data preparation and analysis
	

Analysis procedure conducted in script run_analysis.R
-----------------------------------------------------

The script run_analysis.R comprised the following steps:

	+ read data files from working directory
	+ identify measurement features specified for this analysis (mean and std)
	+ merge subjects, activities and training and test data 
	+ replace numeric codes with descriptive names
	+ calculate average for each variable for each activity and subject
	+ output a tidy data set
	

File submitted directly to Coursera:
-----------------------------------					
	+ dataselect_means_tidy.txt		Output tidy data set in comma-separated text format
									File name *.txt as required for upload to Coursera				


