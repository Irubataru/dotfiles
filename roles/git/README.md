git
===

Configures and installs git and other usefull git related tools.

## Variables

 * `full_name` (global config)<br/>
   The name to use as `user.name`.
 * `git_email` (global config)<br/>
   The email to use as `user.email`.

 * `git_signing_key_has_key` (default `false`)<br/>
   Whether or not to use a key to sign commits.
 * `git_signing_key` (default `undefined`)<br/>
   The key to sign commits with.

## Installs

 * `git`
 * `tig`

TODO: Add `git-bug` install, config, and completion.
