window_root "$PWD"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "zsh"
select_window 0
split_h 50
run_cmd "/usr/bin/tmux resize-pane -t 1 -x 55"
run_cmd "/usr/local/bin/tmux resize-pane -t 1 -x 55"
run_cmd "/usr/bin/clear"
select_pane 0
run_cmd "/usr/local/bin/nvim"

# Split window into panes.
#split_v 20
#split_h 50

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
#select_pane 0
