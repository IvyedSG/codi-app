# CONTEXTO DEL PROYECTO: COLLECT (Flutter - App móvil)

## 🧠 Descripción general

Collect es una aplicación móvil desarrollada en Flutter que permite a los usuarios escanear boletas o recibos para estimar su huella de carbono (CO2). Analiza los productos o servicios consumidos y presenta visualmente el impacto ambiental personal del usuario.

## 🎯 Objetivo

- Escanear boletas con la cámara o entrada manual.
- Detectar productos o servicios dentro de la boleta.
- Calcular una estimación del CO2 generado.
- Mostrar estadísticas, gráficos y consejos sostenibles.
- Visualizar historial de emisiones por fecha o categoría.

## 🧩 Estructura modular propuesta

lib/
├── main.dart
├── app.dart
├── core/ # Temas, constantes, utilidades
│ ├── theme/
│ └── services/
├── data/ # Modelos y datos simulados
│ ├── models/
│ └── mock_data/
├── features/
│ ├── auth/ # Login, registro
│ ├── home/ # Dashboard principal
│ ├── scan/ # Escaneo de boletas
│ ├── results/ # Resultados del análisis
│ ├── history/ # Historial de emisiones
│ └── profile/ # Perfil y configuraciones
├── shared/ # Widgets y componentes reutilizables
└── routes/ # Rutas y navegación

## 🛠️ Tecnologías y patrones

- Flutter SDK
- `provider` o `riverpod` para manejo de estado
- Uso de `camera` y/o `image_picker` para escanear boletas
- UI moderna, simple y accesible
- Navegación con `GoRouter` o `Navigator 2.0`
- Animaciones ligeras y uso eficiente de recursos

## ✅ Alcance actual

- Solo frontend
- No incluye backend ni base de datos local por ahora (se simulan datos)

## 📝 Sugerencias para Copilot

- Crea pantallas en `features/` y widgets reutilizables en `shared/`.
- Mantén separación lógica entre datos, UI y navegación.
- Simula respuestas de escaneo (OCR) en `mock_data/`.
- Asegura consistencia en estilos, navegación y estructura.
- Enfócate en modularidad, legibilidad y reutilización de código
