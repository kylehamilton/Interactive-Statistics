library(DT)
library(metricsgraphics)

shinyUI(pageWithSidebar(
  h4(" Interactive CSV file data analysis and visualization: Statistical summary and Scatter Plot",br()),
  
  sidebarPanel(
    #File upload and selector window
    fileInput('datafile', 'Choose CSV file',
              accept=c('text/csv', 'text/comma-separated-values,text/plain')),
    
    #These column selectors will be dynamically created after the file is loaded
    uiOutput("xvar"),
    uiOutput("yvar"),
    uiOutput("colflag"),
    
    #The conditional panel is triggered by the preceding checkbox
    conditionalPanel(
      condition="input.colflag==true",
      uiOutput("colby")
    ),
    #The action button to plot selected variables
    uiOutput("getPlot")
    
    
  ),
  mainPanel(
    #Prevent errors on the output panel
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"),
    p(h4("Developed by Pandurang Kolekar"),br(), 
      "Contact: ",
      a("pandurang.kolekar@gmail.com", href = "mailto:pandurang.kolekar@gmail.com"),br(),
      a("Visit my webpage.", href = "http://biosakshat.wix.com/pandurang-kolekar")
    ),
    tabsetPanel(
      #To visualize tabular data
      tabPanel("Table", uiOutput("msg"), dataTableOutput('filetable')), 
      #To plot the selected variables
      tabPanel("Plot", uiOutput("plot_msg"), metricsgraphicsOutput('plot')),
      tabPanel("Summary", uiOutput("summary_msg"),verbatimTextOutput("summary")) 
    )    
    
  )
))