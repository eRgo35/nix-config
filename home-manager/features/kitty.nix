{
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };

    theme = "Gruvbox Dark";

    settings = {
      confirm_os_window_close = 0;
      detect_urls = true;
      enable_audio_bell = false;
      resize_in_steps = true;
      # window_padding_width = 16;
    };
  };
}
