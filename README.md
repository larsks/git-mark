# git-mark

This is a tool for adding/removing informative tags to/from your git
commit subject lines.

It is common in many environment to mark git commits in a pull request
(or gerrit change request) as "WIP" (work in progress) or "DO NOT
MERGE" to indicate that the commit has not been finalized and should
not yet be merged into any target branch.  That is, a commit message
might look something like:

    $ git log -1
    commit 915115415bbc7b92ee083900c05bb87d2c0dfe53 (HEAD -> feature/my-new-feature)
    Author: Lars Kellogg-Stedman <lars@oddbit.com>
    Date:   Wed Feb 21 12:16:28 2018 -0500

        [WIP] test new configuration settings

        this commit updates the configuration settings to match
        the upstream requirements.

Once the change is ready for merging, the `[WIP]` tag is removed.

The `git-mark` and `git-unmark` commands automate this process.

## Using git-mark

To add the `[WIP]` tag to to the most recent commit, just run:

    git mark

To remove it:

    git unmark

You can add the tag to a series of commits, for example:

    git mark HEAD~3..

You can specify an explicit tag using the `-m` option:

    git mark -m 'DO NOT MERGE'

And you can change the default tag by setting the `mark.default`
config option:

    git config mark.default 'DO NOT MERGE'

## Installing git-mark

Run `make install` from the project directory.  This will install
`git-mark` into `$(bindir)` (by default `/usr/local/bin`), and will
create a `git-unmark` symlink in the same place.

To install in a different location, you could modify either the
`prefix` or `bindir` variable. For example, to install into
`$HOME/bin`:

    make install prefix=$HOME

Or:

    make install bindir=$HOME/bin

