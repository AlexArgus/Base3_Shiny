#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#




# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
        data <- reactive({
                
                #Transactions[input$city %in% grep(input$city, Points, value = T)]
                
                ia  <- input$adress
                
                ic  <- input$city
                
                ip  <- input$period
                
                ir1 <- input$daterange[1]
                
                ir2 <- input$daterange[2]
                
                if (ia != 'Все') {
                
                    alfa <- Transactions[Point == ia, .(Date, Check, Utility)]
                    
                } else {
                        
                    M    <- grep(ic, Points, value = T)
                        
                    alfa <- Transactions[ Point %in% M, .(Date, Check, Utility) ]    
                }
                
                x <- xts(alfa[ , Check], order.by = alfa[ , Date] )
                
                x <- x[paste0(ir1,'/',ir2)]
                
                ep <- endpoints(x, on = ip, k = 1)
                
                x <- period.sum(x/1000, ep )[-1]
                
                if (input$margin == T) { 
                
                        y <- xts(alfa[ , Utility], order.by = alfa[ , Date] )
        
                        y <- y[paste0(ir1,'/',ir2)]
        
                        ep <- endpoints(y, on = ip, k = 1)
        
                        y <- period.sum(y/1000, ep )[-1]
        
                        graph <- cbind(x, y) } else {graph <- x}
                
                graph
                
        })
        
        
        
        
        output$RevenueOfPoint <- renderDygraph({
                
                dygraph( data(), main = input$adress) %>%
                        
                dyAxis("y", label = "Revenue (Thousands)")
                
                })
        
        output$Adress <- renderUI({
                
                vec <- c( grep(input$city, Points, value = T), 'Все' )
                
                selectInput(
                        "adress",
                        "Adress", 
                        vec,
                        multiple = F)
        })
        
        
  
    
  })



