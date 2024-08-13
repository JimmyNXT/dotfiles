# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "$PWD"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "dev"; then
  new_window "nvim"
  select_window 0
  split_h 50
  run_cmd "/usr/bin/tmux resize-pane -t 1 -x 55"
  run_cmd "/usr/local/bin/tmux resize-pane -t 1 -x 55"
  run_cmd "/usr/bin/clear"
  select_pane 0
  run_cmd "/usr/local/bin/nvim"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
