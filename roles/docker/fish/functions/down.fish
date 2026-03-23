function down --description 'alias down=docker compose down'
    set -l args $argv
    set -l profiles
    set -l i 1

    while test $i -le (count $args)
        if string match -qr '^-.*' -- $args[$i]
            break
        end
        set -a profiles $args[$i]
        set i (math $i + 1)
    end

    set -l rest $args[$i..-1]

    if test (count $profiles) -gt 0
        set -l profile_flags
        for p in $profiles
            set -a profile_flags --profile $p
        end
        docker compose $profile_flags down $rest
    else
        docker compose down $rest
    end
end
