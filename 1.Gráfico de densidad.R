# Cargar librerías necesarias
library(ggplot2)

# PASO 1: Crear una simulación simple a partir de los datos reales
set.seed(123)  # Para reproducibilidad
simulados <- data.frame(
  VICTIMA_EDAD = sample(datos$VICTIMA_EDAD, size = 500, replace = TRUE)
)

# PASO 2: Agregar la columna 'tipo' a cada base
datos$tipo <- "Real"
simulados$tipo <- "Simulado"

# PASO 3: Unir ambos dataframes para comparar gráficamente
edad_total <- rbind(
  datos[, c("VICTIMA_EDAD", "tipo")],
  simulados[, c("VICTIMA_EDAD", "tipo")]
)

# PASO 4: Crear gráfico de densidad
ggplot(edad_total, aes(x = VICTIMA_EDAD, fill = tipo)) +
  geom_density(alpha = 0.5) +
  labs(title = "Distribución de edad: víctimas reales vs simuladas",
       x = "Edad de la víctima",
       y = "Densidad") +
  theme_minimal()

