function fish_prompt
	if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end
    set_color $fish_color_cwd
	echo -n (basename $PWD)
	set_color normal
	echo -n ' ) '
end
