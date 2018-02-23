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

## Examples

With a repository that looks like this:

    $ git log --oneline
    166f3a3 (HEAD -> master) added file5
    d8713e5 added file4
    f692c3d added file3
    bfd4e3e added file2
    361d502 added file1

We can mark the latest commit like this:

    $ git mark 
    Rewrite 166f3a34a3a4b50c378bb511b5cae763882d736d (1/1) (0 seconds passed, remaining 0 predicted)    
    Ref 'refs/heads/master' was rewritten
    20459fa [WIP] added file5

And now the history looks like this:

    $ git log --oneline
    20459fa (HEAD -> master) [WIP] added file5
    d8713e5 added file4
    f692c3d added file3
    bfd4e3e added file2
    361d502 added file1

The `git-mark` command is idempotent, so we can go ahead and mark the
latest three commits:

    $ git mark HEAD~3..
    Rewrite f692c3dbfac074fdb18b10958f7080308eb929c8 (1/3) (0 seconds passed, remaining 0 pRewrite d8713e5172bec85769136c689da057f237105d8d (2/3) (0 seconds passed, remaining 0 pRewrite 20459fae8ccd637bc344adb1a82bd1bdb35248b0 (3/3) (0 seconds passed, remaining 0 predicted)    
    Ref 'refs/heads/master' was rewritten
    33654b7 [WIP] added file5
    c7c7d79 [WIP] added file4
    a6859ba [WIP] added file3


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

## License

git-mark -- automate subject line tags in git commits  
Copyright (C) 2018 Lars Kellogg-Stedman

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
