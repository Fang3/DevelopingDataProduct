library(shiny)
shinyServer(function(input, output) {
  model1 <- lm(mpg~as.factor(cyl)+hp+as.factor(am),data=mtcars)
  # use reactive statement if needs to take input from user
  model1pred <- reactive({
    hpInput <- input$sliderhp
    cylInput <- input$selectcyl
    tranInput <- input$radioauto
    predict(model1, newdata = data.frame(hp = hpInput,cyl=cylInput,am=tranInput))
  })
  
  output$table <- renderTable(mtcars[,c('mpg','cyl','hp','am')])
  
  output$pred1 <- renderText({
    round(model1pred(),2)
  })
  
})

# https://rprojectll123.shinyapps.io/project/