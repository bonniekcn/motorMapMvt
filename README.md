# motorMapMvt
These series of scripts and applets will allow users to grab different sites, indicate the evoked movements at the sites, and select what movements to display.

First use the "siteGrabber.m".  Put in the name of the image of the brain before running.  Then click on each site and put in site numbers.  Right click to delete site; left click to select.  A csv file "allDataPoints.csv" will be created, containing the information about all the clicked sites.

Then use the "chooseMvt.mlapp" applet to select the movements you want to display.  The applet will read in an excel sheet formatted with site numbers at the first column, and movement names in other coloumn (see the "dataTable.xlsx" for template).  Check only one movement from one body part each time.  Click on "add one more item" to add more movements to show.  A file "siteMvt.xlsx" will be created, containing the sites that contain the movements chosen.

Lastly use the "colourVoronoi.m" script to colour the sites that evoked the chosen movement. 
