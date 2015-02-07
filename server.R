# server.R
library(UsingR)

getformula <- function(x) {
     if(length(x)==0) {
        tmp <- "."
     }
     else {
       tmp <- ""
       for (i in seq_len(length(x)) ) {
          tmp <- paste(tmp, x[i], sep="+")
       }
       tmp <- substring(tmp, 2)
       tmp
    }
    tmp <- paste0("mpg ~ ", tmp)
    tmp
}

shinyServer(
    function(input, output) {
      formula <- reactive({getformula({input$id1})})
      output$oid1 <- renderPrint({
         formula()
      })
      output$oid2 <- renderPrint({
         input$goButton
         isolate(summary(lm({formula()}, data=mtcars))$coef)
      })
      output$resPlot <- renderPlot({
         input$goButton
         isolate({
           fit <- lm({formula()}, data=mtcars)
           par(mfrow=c(2,2))
           plot(fit)
         })
      })
    }
)
