library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict Mile per Gallon (mpg)"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderhp",label = h3("What is the Hoursepower of the Car?"),52,325,value=20),
      selectInput("selectcyl", label = h3("Select Number of Cylinders:"), choices = list("4" = 4, "6" = 6, "8" = 8), selected = 4),
      radioButtons("radioauto",label = h3("Choose Transmission Type:"), choiceNames = list('Automatic','Manual'),choiceValues = list(0,1),selected = 0),
      submitButton("Submit") # Add the submit button 
    ),
    mainPanel(
      h3("Select three inputs from left panels and hit submit to see miles pre gallon (mpg) prediction:"),
      h3(textOutput("pred1")),
      
      h3("Example of mtcars:"),
      tableOutput("table")

    )
  )
))