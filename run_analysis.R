# date is stored in the "./Data Cleaning/UCI HAR Dataset" folder

train <- fread("./Data Cleaning/UCI HAR Dataset/train/X_train.txt")[, featuresWanted, with = FALSE]
test <- fread("./Data Cleaning/UCI HAR Dataset/test/X_test.txt")[, featuresWanted, with = FALSE]

activityLabels <- fread("./Data Cleaning/UCI HAR Dataset/activity_labels.txt", col.names = c("classLabels", "activityName"))
features <- fread("./Data Cleaning/UCI HAR Dataset/features.txt", col.names = c("index", "featureNames"))

trainActivities <- fread("./Data Cleaning/UCI HAR Dataset/train/Y_train.txt", col.names = "Activity")
testActivities <- fread("./Data Cleaning/UCI HAR Dataset/test/Y_test.txt", col.names = "Activity")

trainSubjects <- fread("./Data Cleaning/UCI HAR Dataset/train/subject_train.txt", col.names = "SubjectNum")
testSubjects <- fread("./Data Cleaning/UCI HAR Dataset/test/subject_test.txt", col.names = "SubjectNum")

featuresWanted <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[featuresWanted, featureNames]
measurements <- gsub('[()]', '', measurements)

data.table::setnames(train, colnames(train), measurements)
data.table::setnames(test, colnames(test), measurements)

train <- cbind(trainSubjects, trainActivities, train)
test <- cbind(testSubjects, testActivities, test)
dataset <- rbind(train, test)

dataset[["Activity"]] <- factor(dataset[, Activity], levels = activityLabels[["classLabels"]], labels = activityLabels[["activityName"]])
dataset[["SubjectNum"]] <- as.factor(dataset[, SubjectNum])
dataset <- reshape2::melt(data = dataset, id = c("SubjectNum", "Activity"))
dataset <- reshape2::dcast(data = dataset, SubjectNum + Activity ~ variable, fun.aggregate = mean)

# Write the dataset to a file
write.table(dataset, file = "./Data Cleaning/tidy_dataset.txt", row.names = FALSE)