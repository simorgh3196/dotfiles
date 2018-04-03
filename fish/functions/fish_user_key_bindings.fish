# Defined in /Users/hayakawatomoya/.config/fish/config.fish @ line 5
function fish_user_key_bindings
	for mode in insert default visual
    fish_default_key_bindings -M $mode

    bind -M $mode \cr peco_select_ghq_repository
    bind -M $mode \cg peco_open_gh_repository

    bind -M $mode \cf nextd-or-forward-word
    bind -M $mode \ce complete
  end
  fish_vi_key_bindings
end
