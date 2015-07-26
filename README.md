{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww21160\viewh14660\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 #Readme\
\
Mathieu PRADIGNAC\
26 July 2015\
\
##run_analysis R function\
\
##Inputs\
The run_analysis function has only one input which is the name of the folder where the SAMSUNG data will be stored.\
It is defaulted to the name of the course project folder data : UCI HAR Dataset.\
\
**Note that this folder MUST be in your working directory**\
However, you can rename it and pass its new name as a parameter of the function.\
\
Do not touch the organization of the data, the subfolders etc \'85\
\
The Dyplr package is needed for the function to run. Please install it \'ab\'a0install.packages(\'ab\'a0dpyplr\'a0\'bb)\'a0\'bb and then load the library \'ab\'a0library(dyplr)\'a0\'bb\
\
##Outputs\
The run_analysis function will write in the working directory a file called TinyData2.txt.\
\
**Note that if the file already exist, running the function will overwrite it**\
\
##How to use run_analysis\
1- Unzip the data in a folder in your working directory.\
2- Load run_analysis function (run_analysis.R file).\
3- Get the file in your working directory\
\
##How does the function works\
###Step 1 - Read Features File\
The features file containing all the variables names (aka features) is read.\
###Step 2 - Create Training file\
The three files corresponding to Training (subject, activity and measures) are read and bonded together using cbind function.\
The features names are set as column names, following \'ab\'a0Subject\'a0\'bb and \'ab\'a0Activity_Labels\'a0\'bb\
###Step 3 - Create Test file\
Same as step 2 but for Test data\
###Step 4 - bind Training and Test data\
The result of steps 2 and 3 are bound together to make a unique file with all measures.\
###Step 5 - Select only means and standard deviation\
First of all, we select in the feature list, the indexes corresponding to measurement ending up with mean() or std().\
Then we add 2 to each of the value to get the columns references in our data frame where 2 columns (Subject and Activity_Label) have been added.\
###Step 6 - replace activity codes by activity labels\
After reading the activity labels file, we replace Activity_Label of TinyData1 by the corresponding label\
###Step 7 - Create second (and final) tiny data set\
Create 2nd tiny data set with average of each variable for each activity and each subject. We use aggregate of dyplr package (see read me for package installation).\
This data set is then sorted by Subject and the Activity_Label\
Finally we save the file in the working directory as TinyData2.txt\
}