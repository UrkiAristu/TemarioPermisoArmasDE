# 🎯 Temario Permiso de Armas · D / E / AEM

![Licencia: MIT](https://img.shields.io/badge/licencia-MIT-green.svg)
![Sitio estático](https://img.shields.io/badge/sitio-est%C3%A1tico-blue.svg)
![Sin dependencias](https://img.shields.io/badge/dependencias-0-brightgreen.svg)

Aplicación web de **estudio** para preparar la prueba de capacitación (teórica y práctica) de las licencias de armas **D** (armas largas rayadas para caza mayor), **E** (escopetas y asimiladas) y la **Autorización Especial de armas para Menores (AEM)** de la Guardia Civil.

Es un único `index.html` autocontenido: sin frameworks, sin build y sin servidor. Funciona sin conexión una vez cargado.

> 🔗 **Demo:** `https://urkiaristu.github.io/PermisoArmasDE/`

## ✨ Funcionalidades

- 📖 **Temario completo** (introducción + 6 temas + prueba práctica) con imágenes y marcado de secciones leídas.
- ✍️ **Test por tema** con corrección inmediata, filtros (sin responder, falladas, favoritas) y opción de barajar respuestas.
- ⏱️ **Simulacro oficial**: 20 preguntas en 20 minutos, con la proporción oficial por tema (4·3·3·4·3·3). Apto con 16 o más aciertos.
- 🔁 **Repaso** automático de preguntas falladas y favoritas.
- 🔎 **Buscador** global en teoría y preguntas (atajo `/`).
- 🧠 **Modo recall**: difumina los términos subrayados para autoevaluarte.
- 🌓 Temas oscuro / claro / sepia, tamaño de letra ajustable, modo concentración e impresión.
- 📊 **Progreso** guardado en el navegador (`localStorage`), con exportación e importación en JSON.
- ⌨️ Atajos de teclado en los tests: `←` `→`, `1` `2` `3`, `F` (favorita).

## 🗂️ Estructura del repositorio

```text
PermisoArmasDE/
├── index.html          # Aplicación completa (HTML + CSS + JS + banco de preguntas)
├── assets/
│   └── img/            # Imágenes del temario (referenciadas desde index.html)
├── _config.yml         # Configuración de GitHub Pages
├── .gitignore
├── LICENSE             # MIT
└── README.md
```

## 🚀 Uso en local

No necesita instalación. Elige una opción:

```bash
# Opción 1: abrir directamente
open index.html          # macOS  (xdg-open en Linux, start en Windows)

# Opción 2: servidor local (recomendado para probar rutas relativas)
python3 -m http.server 8000
# → http://localhost:8000
```

## 🌐 Despliegue en GitHub Pages

1. Sube el repositorio a GitHub (rama `main`).
2. Ve a **Settings → Pages**.
3. En **Build and deployment → Source** elige **Deploy from a branch**.
4. Selecciona la rama `main` y la carpeta `/ (root)` → **Save**.
5. Tras 1–2 minutos el sitio estará en  
   `https://<usuario>.github.io/PermisoArmasDE/`

> Las rutas de las imágenes son relativas (`./assets/img/...`), por lo que funcionan igual en local y bajo el subdirectorio `/PermisoArmasDE/` de Pages.  
> GitHub Pages distingue **mayúsculas y minúsculas** en los nombres de archivo.

## 🧩 Datos y personalización

- El banco de preguntas está en la constante `QUIZ` (script al final de `index.html`), agrupado por tema: `{ t, o, c, s }` = enunciado, opciones, índices correctos y subapartado.
- El temario está en el `<template id="store">`, una `<section>` por tema.
- El progreso se guarda con la clave `armas_estudio_v1` en `localStorage`; desde *Mi progreso* puedes exportarlo e importarlo.

## ⚠️ Aviso legal

Este proyecto es una herramienta **no oficial** de estudio, basada en el Reglamento de Armas (Real Decreto 137/1993) y en el programa de la Resolución de 19 de octubre de 1998 de la Dirección General de la Guardia Civil. **No está afiliado a la Guardia Civil ni a ningún organismo público.** La normativa puede cambiar: contrasta siempre los contenidos con la fuente oficial y con tu Intervención de Armas antes del examen. El autor no se responsabiliza del resultado de las pruebas.

## 📄 Licencia

El código se distribuye bajo licencia [MIT](LICENSE). Los textos del temario y las imágenes pueden proceder de terceros y **no quedan cubiertos por esta licencia** salvo que seas su titular.
