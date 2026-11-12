#!/usr/bin/env bash
# Reorganiza el repo: files/ -> assets/img/ y actualiza las rutas de index.html.
# Ejecutar UNA vez desde la raíz del repositorio.
set -euo pipefail

[ -f index.html ] && [ -d files ] || { echo "❌ Ejecuta esto en la raíz (donde están index.html y files/)"; exit 1; }

mkdir -p assets/img

# 1) Mover imágenes (git mv conserva el historial si ya es un repo)
if git rev-parse --is-inside-work-tree >/dev/null 2>&1 && [ -n "$(git ls-files files | head -n1)" ]; then
  git mv files/* assets/img/
else
  mv files/* assets/img/
fi
rmdir files 2>/dev/null || true

# 2) Renombrar el único archivo con 'ñ' (evita problemas de codificación/URL)
for f in assets/img/armazon_cerrojo_y_ca*on.jpg; do
  [ -e "$f" ] && [ "$f" != "assets/img/armazon_cerrojo_y_canon.jpg" ] && mv "$f" assets/img/armazon_cerrojo_y_canon.jpg
done

# 3) Actualizar rutas en index.html (copia de seguridad en index.html.bak)
sed -i.bak -E \
  -e 's#\./files/#./assets/img/#g' \
  -e 's#armazon_cerrojo_y_ca[^"/]{1,3}on\.jpg#armazon_cerrojo_y_canon.jpg#g' \
  index.html

# 4) Verificar que cada imagen referenciada existe (distingue mayúsculas)
missing=0
while IFS= read -r p; do
  [ -f "$p" ] || { echo "⚠️  FALTA: $p"; missing=1; }
done < <(grep -oE 'src="\./assets/img/[^"]+"' index.html | sed -E 's#src="\./(.*)"#\1#' | sort -u)

[ "$missing" -eq 0 ] && echo "✅ Rutas actualizadas y verificadas." || echo "❗ Revisa los archivos que faltan arriba."
echo "Si todo va bien: rm index.html.bak"
