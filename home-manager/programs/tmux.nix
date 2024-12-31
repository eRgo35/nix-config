{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-Space";
    keyMode = "vi";
    terminal = "screen-256color";
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      rose-pine
      yank
    ];
    extraConfig = ''
      # history limit
      set -g history-limit 5000

      # increase repeat time
      set -g repeat-time 1000

      # decrese command delay
      set -sg escape-time 1

      # faster key repetition
      set -s escape-time 0

      setw -g aggressive-resize on

      # reload tmux while using tmux
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # Vim like yank
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Open panes in current directory
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"


    '';
  };
}
