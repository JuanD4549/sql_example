#!/bin/bash

# Directorio base de scripts
SCRIPTS_DIR="../liquibase/scripts"

ERRORS=0

echo "🔍 Validando columnas en $SCRIPTS_DIR..."

# Buscar todos los archivos .sql
find "$SCRIPTS_DIR" -type f -name "*.sql" | while read -r file; do
    echo "➡️ Revisando: $file"

    # Detectar columnas agregadas
    ADD_COLUMNS=$(grep -i "ADD COLUMN" "$file")

    if [ -n "$ADD_COLUMNS" ]; then
        # Si hay columnas agregadas, verificar que exista al menos un COMMENT ON COLUMN
        if ! grep -qi "COMMENT ON COLUMN" "$file"; then
            echo "❌ ERROR: El archivo $file agrega columnas pero no contiene comentarios (COMMENT ON COLUMN)"
            ERRORS=$((ERRORS+1))
        else
            echo "✅ El archivo $file contiene comentarios para las columnas agregadas."
        fi
    fi
done

# Resultado final
if [ "$ERRORS" -gt 0 ]; then
    echo "⚠️ Validación fallida: Se encontraron $ERRORS errores."
    exit 1
else
    echo "✅ Todas las columnas agregadas tienen comentarios."
    exit 0
fi
