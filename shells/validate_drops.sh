#!/bin/bash

# Directorio base de scripts
SCRIPTS_DIR="../liquibase/scripts"

# Lista de palabras prohibidas (puedes añadir más)
FORBIDDEN=("DROP" "TRUNCATE" "DELETE FROM")

# Variable para controlar si hubo errores
ERRORS=0

echo "🔍 Validando scripts en $SCRIPTS_DIR..."

# Buscar todos los archivos .sql
find "$SCRIPTS_DIR" -type f -name "*.sql" | while read -r file; do
    echo "➡️ Revisando: $file"
    for keyword in "${FORBIDDEN[@]}"; do
        if grep -qi "$keyword" "$file"; then
            echo "❌ ERROR: El archivo $file contiene la palabra prohibida '$keyword'"
            ERRORS=$((ERRORS+1))
        fi
    done
done

# Resultado final
if [ "$ERRORS" -gt 0 ]; then
    echo "⚠️ Validación fallida: Se encontraron $ERRORS errores."
    exit 1
else
    echo "✅ Todos los scripts cumplen con los estándares."
    exit 0
fi
