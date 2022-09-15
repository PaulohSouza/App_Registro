library(shiny)
library(DT)
library(gsheet)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Controle de ocorrências"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      dateInput("IN_DATA_OCORRENCIA", 
                h3("Selecione a data de ocorrência"), 
                value = "2022-01-01"),  
      selectInput("IN_USUARIO", h3("Escolha o usuário: "), 
                  choices = list("Felipe Araújo" = "Felipe Araújo",
                                 "Paulo Souza" = "Paulo Souza",
                                 "Larissa Santos" = "Larissa Santos"),
                  selected = "Felipe Araújo"),
      selectInput("IN_DEPARTAMENTO", h3("Informe o Departamento: "), 
                  choices = list("Operacional" = "Operacional",
                                 "Pesquisa" = "Pesquisa"),
                  selected = "Operacional"),
      radioButtons("IN_CAUSA", h3("Selecione a causa:"),
                   choices = list("Logística" = "Logística",
                                  "Atraso" = "Atraso",
                                  "Falta de insumos" = "Insumos")
      ),
      selectInput("IN_RESPONSAVEL", h3("Escolha o responsável direto: "), 
                  choices = list("Felipe Araújo" = "Felipe Araújo",
                                 "Paulo Souza" = "Paulo Souza",
                                 "Larissa Santos" = "Larissa Santos")),
      dateInput("IN_DATA_INFORME", 
                h3("Selecione a data atual:"), 
                value = "2022-01-01"),  
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Novo Registro",
                 textAreaInput("IN_PROBLEMA", "Descreva o Problema: ", "informe o problema..", width = "1000px", height = 200),
                 br(),
                 textAreaInput("IN_SOLUCAO", "Sugira algumas soluções: ", "Informe suas propostas de soluções'", width = "1000px", height = 200),
                 tags$head(tags$script(src = "message-handler.js")),
                 actionButton("IN_ENVIAR", "Enviar ", class="btn btn-success", icon= icon("angle-right"))
        ),
        tabPanel("Registros",
                 
                 DT::dataTableOutput("OUT_REGISTROS")
        )
      )
    )
  )
 
 )
)