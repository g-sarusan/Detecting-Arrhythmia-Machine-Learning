# import the necessary packages

from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix

import csv

# store values into x and y, going through each row and column
x = []
y = []
ECG_Signal = []
with open('Feature_Matrix.csv', 'r') as csv_file:
    csv_reader = csv.reader(csv_file)

    for row in csv_reader:
        temp_var=[]
        for iterate in range(row.__len__()):

            if iterate == 0:
                temp_var.append(float(row[iterate]))
            if iterate == 1:
                temp_var.append(float(row[iterate]))
            if iterate == 2:
                x.append(temp_var)
                y.append(float(row[iterate]))



# assign values for training and testing, declare train:test ratio
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.20, random_state=0)

# perform Logistic Regression, output the Classification Prediction and the Accuracy Score
clf = LogisticRegression(random_state=0).fit(x_train, y_train)
print(f"{clf.predict(x_test)} is the predicted classification values for the x_test data set")
print(f"{clf.score(x_test, y_test)} is the accuracy score")

print(f"{confusion_matrix(y_test, clf.predict(x_test))}")
