library(shiny)

fig.width <- 600
fig.height <- 450

# Define UI for miles per gallon application
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Linear Model Explorer for mtcars Dataset"),
    
    # Sidebar with controls to select the variable to plot against
    # mpg and to specify whether outliers should be included
    sidebarLayout(
        sidebarPanel(
            div(
                selectInput(
                    "target", "Target Variable:",
                    c(
                        "Miles/(US) gallon (mpg)" = "mpg",
                        "Displacement (cu.in.) (disp)" = "disp",
                        "Gross horsepower (hp)" = "hp",
                        "Rear axle ratio (drat)" = "drat",
                        "Weight (lb/1000) (wt)" = "wt",
                        "1/4 mile time (qsec)" = "qsec",
                        "Number of carburetors (carb)" = "carb"
                    )
                ),
                selectInput(
                    "numeric", "Numeric Variable:",
                    c(
                        "Miles/(US) gallon (mpg)" = "mpg",
                        "Displacement (cu.in.) (disp)" = "disp",
                        "Gross horsepower (hp)" = "hp",
                        "Rear axle ratio (drat)" = "drat",
                        "Weight (lb/1000) (wt)" = "wt",
                        "1/4 mile time (qsec)" = "qsec",
                        "Number of carburetors (carb)" = "carb"
                    ),
                    selected = "wt"
                ),
                selectInput(
                    "factor", "Factor:",
                    c(
                        "Number of cylinders (cyl)" = "cyl",
                        "V/Straight Engine (vs)" = "vs",
                        "Transmission (am)" = "am",
                        "Number of forward gears (gear)" = "gear"
                    )
                )
            )#,
#             br(),
#             div(
#                 radioButtons("confidence", "Confidence Level:", 
#                              c("90%","95%","99%"), selected = "95%", inline=T)
#             )
         ),
        
        # Show the caption and plot of the requested variable against
        # mpg
        mainPanel(

            tabsetPanel(type = "tabs", 
                tabPanel("Residual Plot", 
                         h3(textOutput("caption")),
                         plotOutput("residualPlot")),
                tabPanel("Summary", 
                         verbatimTextOutput("summary")),
                tabPanel("ANOVA", 
                         verbatimTextOutput("anova"))
            )
            
            
        )
    )
))
