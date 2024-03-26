echo "Creando derivatives de IIIF..."
bundle exec rake wax:derivatives:iiif coleccion &
PID=$!
wait $PID
echo ""

echo "Creando páginas individuales para los elementos de la colección..."
bundle exec rake wax:pages coleccion &
PID=$!
wait $PID
echo ""

echo "Creando índice de búsqueda..."
bundle exec rake wax:search main &
PID=$!
wait $PID
echo ""

exit