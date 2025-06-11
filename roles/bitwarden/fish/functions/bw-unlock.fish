function bw-unlock --description "Unlock Bitwarden vault and export session key"
    set bw_status (bw status | jq -r '.status')

    if test "$bw_status" = locked
        set session_key (bw unlock --raw)
        if test $status -ne 0
            echo "Failed to unlock the Bitwarden vault. Please check your password and try again."
            return 1
        end

        set -gx BW_SESSION "$session_key"

    else if test "$bw_status" = unauthenticated
        echo "You are not authenticated for Bitwarden, use bw-login instead."
        return 1
    else if test "$bw_status" = unlocked
        echo "You are already logged in :)"
    else
        echo "Unknown status code \"$bw_status\""
        return 1
    end
end
