#!/bin/bash

# set tmux panes for ide

tmux split-window -v
tmux resize-pane -D 5
tmux select-pane -U

