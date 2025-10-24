if test -z "$SSH_AUTH_SOCK"
    set -f socket_path "$XDG_RUNTIME_DIR/ssh-agent.socket"
    test -e $socket_path && set -x SSH_AUTH_SOCK $socket_path
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    fish_vi_key_bindings
end
if not which bat >/dev/null; and which batcat >/dev/null
    alias bat=batcat
end
