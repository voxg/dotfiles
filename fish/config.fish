if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    fish_vi_key_bindings
end
if not which bat >/dev/null; and which batcat >/dev/null
    alias bat=batcat
end
