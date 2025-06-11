function cr --description "cd to root of git directory"
    set git_root (git rev-parse --show-toplevel)
    cd $git_root
end
