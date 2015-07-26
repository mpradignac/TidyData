run_analysis <- function (directory = "UCI HAR DAtaset") {
        ## Step 1 - Read Features File
        feat <- read.table(file=file.path(paste("./",directory,"/", sep =""),"features.txt"))
        
        ## Step 2 - Create Training file
        ## Read Training Subject File
        sub_train <- read.table(file=file.path(paste("./",directory,"/train/", sep =""),"subject_train.txt"))
        ## Read Training Set File
        set_train <- read.table(file=file.path(paste("./",directory,"/train/", sep =""),"X_train.txt"))
        ## Read Training Labels File
        lab_train <- read.table(file=file.path(paste("./",directory,"/train/", sep =""),"y_train.txt"))
        ##Create Train File by binding the three above files
        train <- cbind(sub_train, lab_train, set_train)
        colnames(train) <- c("Subject","Activity_Label",as.character(feat[,2]))
        
        ## Step 3 - Create Test file
        ## Read Test Subject File
        sub_test <- read.table(file=file.path(paste("./",directory,"/test/", sep =""),"subject_test.txt"))
        ## Read Test Set File
        set_test <- read.table(file=file.path(paste("./",directory,"/test/", sep =""),"X_test.txt"))
        ## Read Test Labels File
        lab_test <- read.table(file=file.path(paste("./",directory,"/test/", sep =""),"y_test.txt"))
        ##Create test File by binding the three above files
        test <- cbind(sub_test, lab_test, set_test)
        colnames(test) <- c("Subject","Activity_Label",as.character(feat[,2]))
        
        ## Step 4 - bind Training and Test data
        ## Merge the two files
        data <- rbind(train, test)
        
        ## Step 5 - select only means and standard deviation
        ## Determine all lines indexes that contains mean() or std() at the end of the label
        MeanOrStd <- c(grep("mean()",feat[,2]),grep("std()",feat[,2]))
        ## ADD 2 to all indexes as the first two columns of the data set have been added to the measurement (subject and activity labels)
        MeanOrStd <- MeanOrStd + 2
        ## Reduce the data set to the first 2 columns + all means and indexes
        TinyData1 <- data[,c(1,2,MeanOrStd)]
        
        ## Read Activity Labels file
        act_lab <- read.table(file=file.path(paste("./",directory,"/", sep =""),"activity_labels.txt"))
        colnames(act_lab) <- c("activity","label")
        
        ## Replace activity codes by labels in column 2 of data set
        TinyData1$Activity_Label <- act_lab$label[match(TinyData1$Activity_Label,act_lab$activity)]
        
        ## Create 2nd tiny data set with average of each variable for each activity and each subject
        TinyData2 <- aggregate(. ~ Subject+Activity_Label,TinyData1,mean)
        ## Sort TinyData2 by Subject and then Activity
        TinyData2 <- arrange(TinyData2,Subject,Activity_Label)
        ## Create TinyData2.txt file.
        write.table(TinyData2,file = "TinyData2.txt", row.name = FALSE)

}