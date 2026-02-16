# Defined in /Users/hayakawatomoya/.config/fish/config.fish @ line 5
function fish_user_key_bindings
	for mode in insert default visual
    fish_default_key_bindings -M $mode

    bind -M $mode \cr fzf_select_ghq_repository
    bind -M $mode \cg fzf_open_gh_repository

    bind -M $mode \cf nextd-or-forward-word
    bind -M $mode \ce complete
  end
  fish_vi_key_bindings
end

fzf_key_bindings
