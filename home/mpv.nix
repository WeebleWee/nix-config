{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;

    scripts = with pkgs.mpvScripts; [
      modernz
      thumbfast
    ];

    config = {
      osc = "no";
      title-bar = false;
      include = ["~~/noctalia.conf"];

      keepaspect-window = false;
      geometry = "100%x100%";
      volume = 50;
      load-context-menu = true;

      vo = "gpu-next";
      gpu-api = "vulkan";
      hwdec = "auto-safe";

      video-sync = "display-resample";
      interpolation = true;
      tscale = "oversample";

      dscale = "mitchell";
      linear-downscaling = false;
      correct-downscaling = true;

      target-peak = 250;
      tone-mapping = "bt.2390";
      hdr-compute-peak = true;
      gamut-mapping-mode = "perceptual";

      keep-open = true;
      save-position-on-quit = true;

      watch-later-options-remove = [
        "sub-pos"
        "osd-margin-y"
      ];
    };

    profiles.sharpening = {
      glsl-shader = "~~/shaders/adaptive-sharpen.glsl";
    };
    defaultProfiles = [ "high-quality" ];

    bindings = {
      LEFT = "seek -10";
      RIGHT = "seek 10";
      UP = "add volume 2";
      DOWN = "add volume -2";
      "Shift+F1" = "context-menu";
    };

    scriptOpts.modernz = {
      # --- language and display ---
      language = "default";
      icon_theme = "material";
      icon_style = "mixed";
      font = "mpv-osd-symbols";
      layout = "default";

      idlescreen = "yes";
      window_top_bar = "no";
      showwindowed = "yes";
      showfullscreen = "yes";
      showonselect = "no";
      showonpause = "yes";
      keeponpause = "no";
      greenandgrumpy = "no";

      # --- behaviour and scaling ---
      hidetimeout = 1500;
      keep_with_cursor = "yes";
      fadeduration = 150;
      fadein = "yes";
      minmousemove = 0;
      deadzonesize = "0.75";
      deadzone_hide = "instant";
      osc_on_seek = "yes";
      osc_on_start = "both";
      mouse_seek_pause = "yes";
      force_seek_tooltip = "no";

      vidscale = "auto";
      scalewindowed = "0.8";
      scalefullscreen = "0.8";

      # --- elements ---
      show_title = "yes";
      title = "\${media-title}";
      title_font_size = 24;
      chapter_title_font_size = 16;
      cache_info = "no";
      cache_info_speed = "no";
      cache_info_font_size = 12;

      show_chapter_title = "yes";
      chapter_above_title = "no";
      chapter_fmt = "%s";

      timecurrent = "yes";
      timems = "no";
      unicodeminus = "no";
      time_format = "dynamic";
      time_font_size = 16;
      tooltip_font_size = 14;
      speed_font_size = 16;

      # --- title bar ---
      show_window_title = "no";
      window_title_font_size = 26;
      window_controls = "yes";
      windowcontrols_independent = "yes";

      # --- subtitle / OSD margins ---
      sub_margins = "yes";
      osd_margins = "no";
      dynamic_margins = "yes";

      # --- buttons ---
      subtitles_button = "yes";
      audio_tracks_button = "yes";
      jump_buttons = "yes";
      jump_amount = 10;
      jump_more_amount = 60;
      jump_icon_number = "yes";
      jump_mode = "relative";
      jump_softrepeat = "yes";
      chapter_skip_buttons = "no";
      track_nextprev_buttons = "yes";

      volume_control = "yes";
      volume_control_type = "linear";
      volumebar_unmute_on_click = "no";
      volumebar_match_seek_color = "no";
      playlist_button = "yes";
      hide_empty_playlist_button = "no";
      gray_empty_playlist_button = "no";

      fullscreen_button = "yes";
      info_button = "yes";
      ontop_button = "yes";
      ontop_in_topbar = "no";
      screenshot_button = "yes";

      download_button = "yes";
      download_path = "~~desktop/mpv";

      loop_button = "yes";
      shuffle_button = "no";
      speed_button = "yes";

      buttons_always_active = "none";

      playpause_size = 28;
      midbuttons_size = 24;
      sidebuttons_size = 24;

      zoom_control = "yes";
      zoom_in_max = 4;
      zoom_out_min = -1;

      # --- fades and thumbnail box (non-colour) ---
      osc_fade_strength = 100;
      fade_blur_strength = 100;
      fade_transparency_strength = 0;
      window_fade_strength = 100;
      window_fade_blur_strength = 100;
      window_fade_transparency_strength = 0;
      thumbnail_box_padding = "4.5";
      thumbnail_box_radius = 4;
      thumbnail_box_outline_size = 1;

      # --- button interaction ---
      hover_effect = "size,glow,color,box";
      button_hover_size = 115;
      button_held_size = 100;
      button_held_box_alpha = 18;
      button_glow_amount = 5;
      slider_hover_size = 100;
      tooltip_hints = "yes";

      # --- progress bar ---
      seek_handle_size = "0.8";
      seek_handle_border_size = "0.42";
      seek_handle_border_hover_size = "0.31";
      seekbar_height = "medium";
      seekrange = "yes";
      seekrangealpha = 150;
      livemarkers = "yes";
      seekbarkeyframes = "yes";
      slider_rounded_corners = "yes";

      nibbles_style = "gap";
      nibbles_top = "yes";
      nibbles_bottom = "yes";

      automatickeyframemode = "yes";
      automatickeyframelimit = 600;

      persistent_progress = "no";
      persistent_progress_height = 17;
      persistent_buffer = "no";

      # --- misc ---
      visibility = "auto";
      visibility_modes = "never_auto_always";
      tick_delay = "0.0167";
      tick_delay_follow_display_fps = "no";

      # --- element positions ---
      title_offset = 20;
      title_with_chapter_offset = 5;
      chapter_title_offset = 18;
      chapter_above_title_offset = 3;
      time_codes_offset = 0;
      tooltip_height_offset = 5;
      portrait_window_trigger = 950;
      hide_volume_bar_trigger = 1150;
      osc_height = 60;

      # --- mouse commands ---
      title_mbtn_left_command = "script-binding stats/display-page-5";
      title_mbtn_mid_command = "show-text \${path}";
      title_mbtn_right_command = "script-binding select/select-watch-history";

      chapter_title_mbtn_left_command = "script-binding select/select-chapter";
      chapter_title_mbtn_right_command = "show-text \${chapter-list} 3000";

      seekbar_wheel_up_command = "seek 10";
      seekbar_wheel_down_command = "seek -10";

      playlist_mbtn_left_command = "script-binding select/select-playlist";
      playlist_mbtn_right_command = "script-binding select/menu";

      vol_ctrl_mbtn_left_command = "no-osd cycle mute";
      vol_ctrl_mbtn_right_command = "script-binding select/select-audio-device";
      vol_ctrl_wheel_down_command = "osd-msg add volume -5";
      vol_ctrl_wheel_up_command = "osd-msg add volume 5";
      volumebar_wheel_down_command = "osd-msg add volume -5";
      volumebar_wheel_up_command = "osd-msg add volume 5";

      audio_track_mbtn_left_command = "script-binding select/select-aid";
      audio_track_mbtn_mid_command = "cycle audio down";
      audio_track_mbtn_right_command = "cycle audio";
      audio_track_wheel_down_command = "cycle audio";
      audio_track_wheel_up_command = "cycle audio down";

      sub_track_mbtn_left_command = "script-binding select/select-sid";
      sub_track_mbtn_mid_command = "cycle sub down";
      sub_track_mbtn_right_command = "cycle sub";
      sub_track_wheel_down_command = "cycle sub";
      sub_track_wheel_up_command = "cycle sub down";

      play_pause_mbtn_left_command = "cycle pause";
      play_pause_mbtn_mid_command = "cycle-values loop-playlist inf no";
      play_pause_mbtn_right_command = "cycle-values loop-file inf no";

      chapter_prev_mbtn_left_command = "add chapter -1";
      chapter_prev_mbtn_mid_command = "show-text \${chapter-list} 3000";
      chapter_prev_mbtn_right_command = "script-binding select/select-chapter";

      chapter_next_mbtn_left_command = "add chapter 1";
      chapter_next_mbtn_mid_command = "show-text \${chapter-list} 3000";
      chapter_next_mbtn_right_command = "script-binding select/select-chapter";

      playlist_prev_mbtn_left_command = "playlist-prev";
      playlist_prev_mbtn_mid_command = "show-text \${playlist} 3000";
      playlist_prev_mbtn_right_command = "script-binding select/select-playlist";

      playlist_next_mbtn_left_command = "playlist-next";
      playlist_next_mbtn_mid_command = "show-text \${playlist} 3000";
      playlist_next_mbtn_right_command = "script-binding select/select-playlist";

      fullscreen_mbtn_left_command = "cycle fullscreen";
      fullscreen_mbtn_right_command = "cycle window-maximized";

      info_mbtn_left_command = "script-binding stats/display-page-1-toggle";
      ontop_mbtn_left_command = "osd-msg cycle ontop";
      screenshot_mbtn_left_command = "osd-msg screenshot video";

      file_loop_mbtn_left_command = "osd-msg cycle-values loop-file inf no";
      file_loop_mbtn_right_command = "osd-msg cycle-values loop-playlist inf no";

      speed_mbtn_left_command = "osd-msg add speed 1";
      speed_mbtn_right_command = "osd-msg set speed 1";
      speed_wheel_down_command = "osd-msg add speed -0.25";
      speed_wheel_up_command = "osd-msg add speed 0.25";
    };

  };
}
