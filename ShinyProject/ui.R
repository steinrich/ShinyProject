library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Predicting with regression"),
  sidebarPanel(
    sliderInput('mu', 'Define how training set/testing set proportion',value = 0.5, min = 0.2, max = 0.9, step = 0.1)
  ),
  mainPanel(
    plotOutput('newHist'),
    h3('Calculation of the Root Mean Square Error'),
    h4('The RMSE of Training data set is'),
    verbatimTextOutput("RMSE_training"),
    h4('The RMSE of Testing data set is'),
    verbatimTextOutput("RMSE_testing"),
    h3('User Guide Documentation'),
    h4('This is a plot showing the effect of setting different training set/testing set in linear regression '),
    h4('For example, you devide the dataset into 70% training set and 30% testing set, by setting the proportion at 0.7'),
    h4('As you move the value to the left, less sample points will be allocated to the test set(left), and more allocated to training set (right); '),
    h4('As you move the value to the left, Root Mean Square Error of testing set decreases and that of training set increases'),
    h4('Try 0.2 vs 0.9 to see the difference')
  )
))