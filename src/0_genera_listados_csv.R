library(tidyverse)

df <- haven::read_spss('./data/raw/ENCUESTA_base_final_sin_anonimizar_G.sav')
df <- df %>%
  mutate(
    fecha_encuesta = as.POSIXct(fecha_encuesta * 86400, origin = "1900-12-30", tz = "UTC"),
  )

df %>% write_csv('./data/ENCUESTA_base_final_sin_anonimizar_G.csv')

univ <- readxl::read_xls('./data/raw/UNIVERSO_Listado_relevamiento23_130.xls')
univ %>% write_csv('./data/UNIVERSO_Listado_relevamiento23_130.csv')
