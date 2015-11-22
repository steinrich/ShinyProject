library(shiny)
library(ggplot2)
library(caret)
data("faithful")


shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      set.seed(333)
      mu<-input$mu
      inTrain<-createDataPartition(y=faithful$waiting,p=mu,list=FALSE)
      trainFaith<-faithful[inTrain,]
      testFaith<-faithful[-inTrain,]
      lml<-lm(eruptions~waiting,data=trainFaith)
      par(mfrow=c(1,2))
      plot(trainFaith$waiting,trainFaith$eruptions,pch=19,col="blue")
      lines(trainFaith$waiting,predict(lml),lwd=3)
      plot(testFaith$waiting,testFaith$eruptions,pch=19,col="blue")
      lines(testFaith$waiting,predict(lml,newdata=testFaith),lwd=3)
      output$RMSE_training<-renderPrint({sqrt(sum((lml$fitted.values-trainFaith$eruptions)^2))})
      output$RMSE_testing<-renderPrint({sqrt(sum((predict(lml,newdata=testFaith)-testFaith$eruptions)^2))})
      })
  }
)