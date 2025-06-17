# Ordenar por probabilidad y mantener solo los escenarios más frecuentes (opcional: top 20)
escenarios_top <- escenarios %>%
  arrange(desc(probabilidad)) %>%
  slice(1:20)  # puedes cambiar 20 por el número de escenarios que quieras mostrar

# Gráfico mejorado
ggplot(escenarios_top, aes(x = reorder(escenario, probabilidad), y = probabilidad)) +
  geom_col(fill = "firebrick") +
  coord_flip() +
  labs(
    title = "Top 20 escenarios simulados de feminicidio más probables",
    x = "Escenario (edad - vínculo)",
    y = "Probabilidad estimada"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    axis.text.y = element_text(size = 10),
    plot.title = element_text(hjust = 0.5, face = "bold")
  )
