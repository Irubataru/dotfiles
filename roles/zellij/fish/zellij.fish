if status is-interactive

  # set ZELLIJ_AUTO_EXIT true
  # if not set -q ZELLIJ
  #   if test "$ZELLIJ_AUTO_ATTACH" = "true"
  #       zellij attach -c
  #   else
  #       zellij -l welcome
  #   end
  #
  #   if test "$ZELLIJ_AUTO_EXIT" = "true"
  #       kill $fish_pid
  #   end
  # end

  eval (zellij setup --generate-auto-start fish | string collect)
end
