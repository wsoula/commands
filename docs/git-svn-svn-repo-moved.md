https://git.wiki.kernel.org/index.php/GitSvnSwitch

GitSvnSwitch
---

When an SVN repository moves, the equivalent of svn switch for git-svn is required. See git-svn for info about using git as a client to subversion.

General Case
---

What immediately sprang to mind, and what was suggested e.g. on the mailing list, was to simply edit your .git/config, and change the url= in the section [svn-remote "svn"]. That doesn't work, however. Instead, I found several suggestions to use variations ofthis theme:
* Edit the svn-remote url URL in .git/config to point to the new domain name
* Run `git svn fetch` - This needs to fetch at least one new revision from svn!
* Change svn-remote url back to the original url
* Run `git svn rebase -l` to do a local rebase (with the changes that came in with the last fetch operation)
* Change svn-remote url back to the new url
* Run `git svn rebase` should now work again!
This will only work, if the `git svn fetch` step actually fetches anything! (Took me a while to discover that... I had to put in a dummy revision to our svn repository to make it happen!)

Using git-filter-branch
---

One can also use `git filter-branch` directly to rewrite the copied svn-history so that the `git-svn-id:` points to the right place. This technique has been documented at this entry on winterstream's blog. The heart of the technique uses sed to rewrite the `git-svn-id:` entries, but it also includes some magic with `git-gc` and `awk` to do more complete history rewriting.


Using rewriteRoot
---

Another -and perhaps easier- option is to use the rewriteRoot config variable to alias the old and new URLs.
In the simplest case, when the SVN repository has been simply moved (not mirrored) from one URL to another, you can use those commands:
```
$ git config --local --replace-all svn-remote.<name>.rewriteRoot `git config --local --get svn-remote.<name>.url`
$ git config --local --replace-all svn-remote.<name>.url <new_url>
```
Where <name> is usually svn, and <new_url> is the new URL for the repository.
From now on git-svn will use the new URL, but it will pretend (internally) to be still using the old one.
In case you want to use a different SVN mirror or a recreated SVN repository there's an additional complication, because the new ropository will have a different UUID (Universally Unique IDentifier) than the previous one. In that case you could try to use the similar rewriteUUID mechanism (beware, I haven't tested it). You can read more about it in the git-svn help.
