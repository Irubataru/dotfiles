function git-config-op --description "Configure git repo with Omegapoint defaults"
    git config user.email aleksandra.odegaard@omegapoint.no
    git config gpg.format ssh
    git config user.signingkey ~/.ssh/omegapoint_sign.pub
end
