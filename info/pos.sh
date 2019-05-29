#=======| Permission for execute
prg='/usr/bin/mazonwelcome.sh'

if [[ -e "$prg" ]]; then
    chmod -v +x "$prg"
fi

unset prg