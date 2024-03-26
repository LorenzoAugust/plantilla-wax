echo "Actualizando contenedor..."
bundle update &
PID=$!
wait $PID
echo ""

exit