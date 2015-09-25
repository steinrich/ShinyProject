train_subject<-read.table("UCI HAR Dataset/train/subject_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")

test_subject<-read.table("UCI HAR Dataset/test/subject_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")

train_table<-cbind(train_subject,y_train,X_train)
test_table<-cbind(test_subject,y_test,X_test)
data_set<-rbind(train_table,test_table)

features<-read.table("UCI HAR Dataset/features.txt")
features<-as.vector(features$V2)
colnames(data_set)<-c("subject","label",features)

mean_col_name<-grep("mean",names(data_set),value=TRUE)   #select the colname with mean
std_col_name<-grep("std",names(data_set),value=TRUE)     #Select the colname with std
data_mean_std<-data_set[,c("subject","label",mean_col_name,std_col_name)]  #Create a subset including mean/std related column only

actlabel<-read.table("UCI HAR Dataset/activity_labels.txt") #read the activity label file into actlabel 
colnames(actlabel)<-c("label","activity")            #add colname to actlabel table
data_mean_std_act<-merge(actlabel,data_mean_std,by="label") #merge activity table with data_set by label

#Set up a dataframe for merging data later
by_act_table<-data.frame()
col_n<-4
colnamevector<-colnames(data_mean_std_act)
agg<-aggregate(data_mean_std_act[,col_n], by=list(activity=data_mean_std_act$activity,subject=data_mean_std_act$subject),FUN=mean)
colnames(agg)<-c('activity','subject',colnamevector[col_n])
by_act_table<-agg

#Run a loop to calculate mean of variable per activity per subject
for (col_n in (5:82)) {
  agg<-aggregate(data_mean_std_act[,col_n], by=list(activity=data_mean_std_act$activity,subject=data_mean_std_act$subject),FUN=mean)
  colnames(agg)<-c('activity','subject',colnamevector[col_n])
  by_act_table<-merge(by_act_table,agg,by=c("activity","subject"))
}

by_act_table<-by_act_table[with(by_act_table,order(activity,subject)),] #Sort the tidy dataset
write.table(by_act_table,"Getting_and_Cleaning_Data.txt",row.names=FALSE) #Write it into text file
