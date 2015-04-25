library(shiny)
library(ggplot2)

data(mtcars)

#It is noted that the number of cylinders, automatic/manual transmission,
#v engine/straight engine and 
#number of gears should be converted from numeric to factor variables for 
#regression analysis.
mtcars$cyl <- factor(mtcars$cyl)
mtcars$vs <- factor(mtcars$vs)
levels(mtcars$vs) <- c("V Engine", "Straight Engine")
mtcars$am <- factor(mtcars$am)
levels(mtcars$am) <- c("Automatic", "Manual")
mtcars$gear <- factor(mtcars$gear)

# Define server logic required to plot various variables against
# mpg
shinyServer(function(input, output) {
    
    # Compute the formula text in a reactive expression since it is
    # shared by the output$caption and output$mpgPlot functions
    formulaText <- reactive({
        #paste("mpg ~", input$variable)
        paste(input$target, "~", paste(input$numeric, input$factor, sep=" + "))
    })
    
    # Return the formula text for printing as a caption
    output$caption1 <- renderText({
        formulaText()
    })
    output$caption2 <- renderText({
        formulaText()
    })
    output$caption3 <- renderText({
        formulaText()
    })
    
    model <- reactive({
        lm(as.formula(formulaText()), mtcars)
    })
    
    # Generate a residual plot of model
    output$residualPlot <- renderPlot({
        par(mfrow=c(2,2))
        plot(model())
    })

     # Print the model summary of the true model
     output$summary <- renderPrint({
         summary(model())
     })    

     # Print the model summary of the true model
     output$anova <- renderPrint({
         anova(model())
     })   
    
})
