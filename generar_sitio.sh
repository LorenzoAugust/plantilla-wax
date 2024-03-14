echo "Creando versión finalizada y previsualización..."
bundle exec jekyll serve --host 0.0.0.0 --watch &
PID=$!
wait $PID
echo ""

exit