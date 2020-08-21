checkout_all ()
{
    (git submodule foreach 'git checkout master')
}

pull_all ()
{
    (git submodule foreach 'git pull')
}

stash_all ()
{
    (git submodule foreach 'git stash')
}

"$1"