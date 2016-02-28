# ui.R file
# This app was developed to help people choose the best car for their trip, using mtcars dataset.

library(markdown)

shinyUI(navbarPage("Select the best car for your trip",
                   tabPanel("Table",
                            
                            # Sidebar
                            sidebarLayout(
                                sidebarPanel(
                                    helpText("Provide information about your trip and the carachteristics of the car that you want"),
                                    numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 10000),
                                    numericInput('cost', 'Current Gasoline Price (per gallon):', 2.00, min = 1, max = 4, step=0.01),
                                    numericInput('gas', 'Maximum expenditure on gasoline:', 50, min=1, max=10000),
                                    checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                                    sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
                                    sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
                                    checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
                                ),
                                
                                
                                mainPanel(
                                    dataTableOutput('table')
                                )
                            )
                   ),
                   tabPanel("About",
                            mainPanel(
                                includeMarkdown("about.md")
                            )
                   )
)
)   