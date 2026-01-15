# Shared socket for all shells
set -gx SSH_AUTH_SOCK "$HOME/.ssh/ssh-agent.sock"

function ensure_ssh_agent --on-event fish_prompt
    # If socket exists and agent replies, reuse it
    if test -S "$SSH_AUTH_SOCK"
        ssh-add -l >/dev/null 2>&1; and return
    end

    # Otherwise start a new agent and set env vars in fish style
    rm -f "$SSH_AUTH_SOCK"

    # Run ssh-agent and capture its output (single line)
    set -l out (ssh-agent -a "$SSH_AUTH_SOCK")

    # Example output:
    # SSH_AUTH_SOCK=/path; export SSH_AUTH_SOCK; SSH_AGENT_PID=123; export SSH_AGENT_PID; echo Agent pid 123;
    # Extract SSH_AGENT_PID from that
    for token in $out
        if string match -rq '^SSH_AGENT_PID=' $token
            set -gx SSH_AGENT_PID (string split -m1 '=' $token)[2]
        end
    end
end
