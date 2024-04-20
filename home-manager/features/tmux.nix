{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-b";
    plugins = with pkgs.tmuxPlugins; [
      sensible 
      vim-tmux-navigator
    ]; 
  };
}
