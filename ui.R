#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#



# Define UI for application that draws a histogram
shinyUI(fluidPage( theme = shinytheme('flatly'),
        
        # Application title
        titlePanel("Объемы продаж сети ДД"),
        
        
        # Sidebar with a slider input for adress of Points of Sales
        sidebarLayout(
                sidebarPanel(
                        
                        
                                
                        selectInput("city", "City", Cites, selected = 'Бердск', multiple = FALSE),
                       
                        
                        uiOutput("Adress"),
                        
                        # selectInput('adress', 'Adress', grep(input$city, Points, value = T), 
                        #             selected = NULL, multiple = FALSE,
                        #             selectize = TRUE, width = NULL, size = NULL),
                        
                        # selectInput('adress', 'Adress', Points, 
                        #             selected = NULL, multiple = FALSE,
                        #             selectize = TRUE, width = NULL, size = NULL),
                        
                        selectInput('period', 'Period', Periods, selected = 'days', multiple = FALSE),
                        
                        
                        
                        dateRangeInput("daterange", "Дипазон дат:",
                                       start  = "2016-09-01",
                                       end    = "2017-04-16",
                                       min    = "2016-09-01",
                                       max    = "2017-04-19",
                                       format = "yyyy-mm-dd",
                                       startview = "months",
                                       separator = " - "),
                        
                        checkboxInput("margin", "Margin Profit", FALSE)
                ),
                
                # Show a plot of the generated distribution
                mainPanel( dygraphOutput("RevenueOfPoint") )
        )
))
