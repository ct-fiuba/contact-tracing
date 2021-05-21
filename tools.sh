checkout_all ()
{
    (git submodule foreach 'git checkout master || git checkout main')
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