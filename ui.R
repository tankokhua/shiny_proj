# ui.R

shinyUI (pageWithSidebar(
    headerPanel("Exploratory Analysis of 'mtcars' dataset"),
    sidebarPanel(
       checkboxGroupInput("id1", "Regressors",
             c("cyl" = "cyl", "disp" = "disp", "hp" = "hp", "drat" = "drat", 
               "wt" = "wt",   "qsec" = "qsec", "vs" = "vs", "am"   = "am",
               "gear" = "gear", "carb" = "carb")
       )

    ),
    mainPanel(
       h4("Linear Regression Formula:"),
       verbatimTextOutput("oid1"),
       h4("Coefficients:"),
       verbatimTextOutput("oid2"),
       h4("Residual Plots:"),
       plotOutput("resPlot")
    )
))

