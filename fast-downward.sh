
# Ottieni il numero totale di parametri
num_parametri=$#

# Crea una nuova lista con tutti i parametri tranne l'ultimo
parametri_tranne_ultimo=("${@:1:$num_parametri-1}")

python3 $FAST_DOWNWARD_HOME/fast-downward.py "${parametri_tranne_ultimo[@]}" 
mv sas_plan* Script_python/${!#}
python3 Script_python/planParser.py "${!#}"
