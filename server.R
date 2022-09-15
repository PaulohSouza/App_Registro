library(gsheet)
library(openxlsx)

df <- as.data.frame(gsheet2tbl("https://docs.google.com/spreadsheets/d/1Rw92CBAn4Th4wYp1R1ecYgWH1ypUDl0y/edit#gid=2079184000"), header = TRUE)

library(shiny)


Salvar <- function(df){
  
  output_path <- "https://docs.google.com/spreadsheets/d/1Rw92CBAn4Th4wYp1R1ecYgWH1ypUDl0y/edit#gid=2079184000"
  wb <- createWorkbook(output_path) 
  saveWorkbook(wb, output_path, overwrite=TRUE)
  #writeDataTable("https://docs.google.com/spreadsheets/d/1Rw92CBAn4Th4wYp1R1ecYgWH1ypUDl0y/edit#gid=2079184000", df)
  #openxlsx::write.xlsx(df, file = "https://docs.google.com/spreadsheets/d/1Rw92CBAn4Th4wYp1R1ecYgWH1ypUDl0y/edit#gid=2079184000", rowNames = FALSE)
  
}
Salvar(df)
# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
    
    observeEvent(input$IN_ENVIAR, {
      # INDICE <- nrow(df)
      # INS <- c(INDICE, as.character(input$IN_DATA_OCORRENCIA), input$IN_USUARIO, input$IN_DEPARTAMENTO,
      #        input$IN_PROBLEMA, input$IN_CAUSA, input$IN_SOLUCAO, input$IN_RESPONSAVEL)
         showNotification("Prezados - Aqui é um aplicativo teste - Após o clique será inserido na planilha do Drive! - Por segurança na planilha, Não habilitei a função ainda! (Paulo)")
      # df[nrow(df) + 1,] <- INS
      #INS <- append(INS, after = length(INS))
      #Salvar(df)
    })
  
    output$OUT_REGISTROS <- DT::renderDataTable({
            df

    })
    
    
})