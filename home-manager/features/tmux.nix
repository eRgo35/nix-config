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
      gruvbox
      yank
    ];
    extraConfig = ''
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
