# PASO 1: Crear vínculo simulado a partir de los datos reales
relaciones_posibles <- unique(na.omit(datos$VINCULO))  # Relación original
simulados$VINCULO <- sample(relaciones_posibles, size = nrow(simulados), replace = TRUE)

# PASO 2: Confirmar que ambas bases tienen la variable 'tipo'
# Ya fue creada anteriormente

# PASO 3: Unir reales y simulados
relacion_total <- rbind(
  datos[, c("VINCULO", "tipo")],
  simulados[, c("VINCULO", "tipo")]
)

# PASO 4: Crear gráfico de barras
library(ggplot2)
ggplot(relacion_total, aes(x = VINCULO, fill = tipo)) +
  geom_bar(position = "dodge") +
  labs(title = "Comparación de vínculo víctima–agresor (real vs simulado)",
       x = "Vínculo",
       y = "Frecuencia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
