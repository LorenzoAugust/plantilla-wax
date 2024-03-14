echo "Borrando versión previa de la colección..."
bundle exec rake wax:clobber coleccion &
PID=$!
wait $PID
echo ""

exit