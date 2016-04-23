





folds <- createFolds(y = training$classe, k = 10, 
                     list = T, returnTrain = F)

sapply(folds,length)

# training[folds[[1]], ] # gets 1st training set

# Larger k = less bias, more variance
# Accurate estimate of bias btwn predictive and true values, but it will depend more heavily of variance between samples
# Smaller k = more bias, less variance
# If fine tuning over a large number of observations/variables, may want to increase number of CV/bootstrap samples

# Make predictions
predictions <- predict(modelFit_rf, newdata = train_test)
confusionMatrix(predictions, train_test$classe)
missClass


varImp(modelFit_rf, scale = FALSE)
varImpObj <- varImp(modelFit_rf)
plot(varImpObj, main = "Variable Importance")

print(modelFit$finalModel)

print(modelFit$results)

rattle::fancyRpartPlot(modelFit$finalModel)
  