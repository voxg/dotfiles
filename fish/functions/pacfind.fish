function pacfind -d "Search pacman for packages and install"
    set --local PKG (pacman -Slq | fzf --multi --preview 'pacman -Si {1}')
    if test -n "$PKG"
        sudo pacman -S $PKG
    end
end

function yayfind
    set --local PKG (yay -Slq | fzf --height 40% --layout reverse --border \
        --header="Fuzzy Package Search (yay)" \
        --preview="yay -Si {1}" | awk '{print $1}')
    if test -n "$PKG"
        yay -S $PKG
    end
end
