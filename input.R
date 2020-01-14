dataset = read.csv('Indian Liver Patient Dataset (ILPD).csv')


# Encoding the target feature as factor
dataset$X1 = factor(dataset$X1, levels = c(2, 1))
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$X1, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[1] = scale(training_set[1])
test_set[1] = scale(test_set[1])

# Fitting Naive Bayes to the Training set
library(e1071)
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$X1) 

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm

