function git-config-obos --description "Configure git repo with Omegapoint defaults"
    git config user.email aleksandra.glesaaen.odegard@obos.no
    git config gpg.format ssh
    git config user.signingkey ~/.ssh/omegapoint_sign.pub
end
