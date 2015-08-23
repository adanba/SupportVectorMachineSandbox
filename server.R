library(caret)
library(datasets)
library(e1071)
library(dplyr)
library(shinyjs)
library(shiny)

## load the iris dataset
data(iris)
names(iris)<-tolower(names(iris))

shinyServer(function(input, output, session) {
    
    ## Reactive funtion for subsetting the iris dataset based on the set X and Y axis
    irisData <- reactive({  
        iris %>% select_("species", input$x, input$y) %>% arrange_("species",input$x, input$y)
    })
    
    ## Reactive function for building a SVM classification model based on the irisData() subset. 
    irisModel <- reactive({  
        svm(species~., data=irisData(), kernel=input$kernel,type=input$type, cost=input$cost, gamma =input$gamma)
    })
    
    ## Generate a scatter plot of the irisData() subset, highlighting the classes, support vectors and 
    ## inlude and contour plot of the class regions
    output$myChart <- renderPlot({
        if(input$x==input$y){ 
            plot(1,1,col="white")
            graphics::text(1,1,"X variable and Y variable must have different values")
            }else{
                aformula = as.formula(paste(input$y,"~",input$x))
                plot(irisModel(),data=irisData() ,formula=aformula, svSymbol = "x", grid = 200, dataSymbol = "x",
                     symbolPalette = rainbow(3), col = rainbow(3,s=0.2))
                legend(title ="Observed species","topleft", irisData()$species, col = c("red", "green", "blue"), legend=levels(irisData()$species), pch="x")
                }
        })
    
    #SVM model summary
    output$summary <- renderPrint({
        summary(irisModel())
    })
    
    #SVM confusion Matrix and Statistics
    output$confusionMatrix <- renderPrint({
        confusionMatrix(irisData()$species, predict(irisModel(),irisData()))
    })
    
    #Resetting all input varaiables.
    observeEvent(input$reset, {
        reset("side-panel")
    })
    
})

