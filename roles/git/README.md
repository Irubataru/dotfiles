# git

Configures and installs git and other usefull git related tools.

## API tokens

Github and gitlab API tokens are set through the environment variables

```zsh
export GITHUB_API_TOKEN=""
export GITLAB_TOKEN=""
```

These needs to be set for e.g. github integration in neovim if not using the
github cli.

## Variables

 * `full_name` (global config)<br/>
   The name to use as `user.name`.
 * `git_email` (global config)<br/>
   The email to use as `user.email`.

 * `git_signing_key_has_key` (default `false`)<br/>
   Whether or not to use a key to sign commits.
 * `git_signing_key` (default `undefined`)<br/>
   The key to sign commits with.
