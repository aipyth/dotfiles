COURCES_DIR=/home/john/Documents/university-notes/cources/
PDFS_DIR=/home/john/Documents/pdfs/
# the terminal to open editor in
OPEN_TERMINAL='kitty'
OPEN_WITH='nvim'

function open_nvim_cource_file() {
  local kitty_paddless_config="/home/john/.config/kitty/kitty-paddless.conf"

  if [[ $OPEN_TERMINAL == 'kitty' ]]
  then
    # kitty --config $kitty_paddless_config $OPEN_WITH "${selected_file}" & 
    kitty --config $kitty_paddless_config -e $OPEN_WITH &
  else 
    eval $OPEN_TERMINAL -e $OPEN_WITH &
    # eval $OPEN_TERMINAL $OPEN_WITH "$selected_file" &
  fi
  editor_pid=$(echo $!)
}

######################################################

cources=$(ls ${COURCES_DIR})

selected_cource=$(echo "${cources}" | rofi -dmenu)

if [ -z "$selected_cource" ]
then
    exit
fi

selected_cource_path=${COURCES_DIR}${selected_cource}
cd "${selected_cource_path}"
# tex_files=$(ls *.tex)
# selected_file=$(echo "${tex_files}" | rofi -dmenu)


open_nvim_cource_file


# initiate figures watcher
cd ./figures
inkscape-figures watch &

# Now open lecture file of exists
rofi -show file-browser-extended -file-browser-dir "$PDFS_DIR"

echo "editorpid $editor_pid"

# start inkscape shortcut manager
cd ~/sources/inkscape-shortcut-manager/
python main.py &
shortcut_manager_pid=$(echo $!)

echo "shortcut pid $shortcut_manager_pid"

# closes the script and processes after nvim quits
for (( ; ; ))
do
    if ps -p $editor_pid > /dev/null
    then 
        sleep 1
        continue
    fi
    kill $shortcut_manager_pid
    break
done
