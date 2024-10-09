#!/bin/bash

# Función para reemplazar el contenido de los archivos
replace_urls() {
    # Recorre todos los archivos de la estructura con extensión .html
    find . -type f -name "*.html" | while read -r file; do
        # Reemplazar URLs dentro de los archivos .html
        sed -E -i 's/https:\/\/contenthub\.netacad\.com\/srwe-dl\/[0-9]*\.[0-9]*\.[0-9]*#([0-9]*\.[0-9]*)/..\/\1\/\1.html/g' "$file"
        sed -E -i 's/https:\/\/contenthub\.netacad\.com\/srwe-dl\/[0-9]*\.[0-9]*\.[0-9]*#([0-9]*)/..\/\1\.0\/\1\.0.html/g' "$file"
        sed -E -i 's/href="https:\/\/contenthub\.netacad\.com\/srwe-dl\/[0-9]*\.[0-9]*\.[0-9]*\?lng=es-XL"//g' "$file"
        sed -E -i 's/href="https:\/\/contenthub\.netacad\.com\/srwe-dl\/[0-9]*\.[0-9]*\.[0-9]*"//g' "$file"
        echo "URLs reemplazadas en: $file"
    done
}

# Función para renombrar archivos .html
rename_files() {
    # Recorre todos los archivos de la estructura con extensión .html
    find . -maxdepth 2 -type f -name "*.html" | while read -r file; do
        # Obtiene el directorio de la ruta del archivo
        dir=$(dirname "$file")
        
        # Obtiene el nombre de la carpeta (directorio)
        folder_name=$(basename "$dir")
        
        # Define el nuevo nombre del archivo como carpeta.html
        new_file="$dir/$folder_name.html"
        
        # Renombra el archivo
        git mv "$file" "$new_file"
        
        # Mensaje de confirmación
        echo "Archivo renombrado: $file -> $new_file"
    done
}

# Ejecutar las dos funciones
replace_urls
rename_files
