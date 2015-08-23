library(shiny)
require(rmarkdown)

shinyUI(pageWithSidebar(
    headerPanel("Support Vector Machine Sandbox"),
    
    sidebarPanel(
        shinyjs::useShinyjs(),
        id = "side-panel",
        
        selectInput(inputId = "x",
                    label = "X variable",
                    choices = c("Petal Length" = "petal.length",
                                "Petal Width" = "petal.width", 
                                "Sepal Length" = "sepal.length", 
                                "Sepal Width" = "sepal.width"),
                    selected = "petal.length"),
        selectInput(inputId = "y",
                    label = "Y variable",
                    choices = c("Petal Length" = "petal.length",
                                "Petal Width" = "petal.width", 
                                "Sepal Length" = "sepal.length", 
                                "Sepal Width" = "sepal.width"),
                    selected = "petal.width"),
        
        selectInput(inputId = "type",
                    label = "Classification type",
                    choices =  c("C" = "C-classification",
                                 "nu" = "nu-classification"), 
                    selected = "C-classificationd"),
        
        selectInput(inputId = "kernel",
                    label = "SVM kernel",
                    choices =  c("Linear" = "linear",
                                 "Polymonial" = "polynomial", 
                                 "Radial Basis" = "radial", 
                                 "Sigmoid" = "sigmoid"),
                    selected = "linear"),
        
        sliderInput(inputId = "cost", 
                    label = "Cost:", 
                    min=1, max=1000, value=1),
        
        sliderInput(inputId = "gamma", 
                    label = "Gamma:", 
                    min=1, max=10, value=1,step=0.5),
        
        actionButton("reset", "Reset")  
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Plot", plotOutput("myChart")), 
            tabPanel("Summary", verbatimTextOutput("summary")), 
            tabPanel("Confusion Matrix", verbatimTextOutput("confusionMatrix")),
            tabPanel("Help", includeMarkdown("./help.md"))
        )
    )
))