# [dotfiles][repo], a simple way to get a real developer [console][cli].

## Features:

- [Bash][bash] developer promt, identify files by color, useful aliases. 
- [Git][git] default configuration, useful git alias & autocomplete enabled by default.
- [Sinatra][sinatra] smart alias.
- [Ruby on Rails][rails] 2 & 3 smart alias.
- Default [rvm][rvm], [rubygems][gem] settings.
- [Vagrant][vagrant] status directly in the promt!
- Other example configuration files. 

## Installation

### Using Git

_This is the recommended way._
**We just provide example files**, in order to use them you should add/remove features from our file to yours.
_IMPORTANT: Please backup your original files before this, we don't want drama. For example `mv .bashprofile .bashprodile.old`_

```sh
    git clone https://github.com/mariozaizar/dotfiles.git ~/.dotfiles;
    open ~/.dotfiles;

    # Compare the two files (ours, and yours). 
    opendiff ~/.dotfiles/dot.gitconfig ~/.gitconfig

    # Merge our changes to your file. (only if you're a pro). If not:

    # 1) Make a backup from your original file. For example:
    mv ~/.gitconfig ~/.gitconfig.old;

    # 2) Create a symbolic link between our file pointing to yours.
    ln -s ~/.dotfiles/dot.gitconfig ~/.gitconfig;  
```

Restart your proyect, and that's it!. If you want uninstall it, just restore the *.old files.
_Note: ln -s will create a symbolic link between dotfiles files, so please do not remove the dotfiles folder._

### Environment

I am running on Mac OS X, but it will likely work on Linux as well with minor fiddling. 

## Screenshoots

![bash-1](http://github.com/mariozaizar/dotfiles/raw/master/images/bash-1.jpg)
[Example I](http://github.com/mariozaizar/dotfiles/raw/master/images/bash-1.jpg), [Example II](http://github.com/mariozaizar/dotfiles/raw/master/images/bash-2.jpg)

## Current files

- .bash_aliases
- .bash_profile
- .diffmerge.sh
- .gemrc
- .git-completion.bash
- .gitconfig
- .irbrc
- .rvmrc
- .ssh/config

## Contribute

* [Report bugs!](https://github.com/mariozaizar/dotfiles/issues?labels=Bugs)
* [Suggest new goodies!](https://github.com/mariozaizar/dotfiles/issues?labels=Features)
* _Buy me a beer ([or something better][amazon])_

## About

### Project page: <https://github.com/mariozaizar/dotfiles>, and [help](https://github.com/mariozaizar/dotfiles/issues?labels=Help).
Follow me on [Twitter!][twitter], read [our blog][crowdint] or stalk me on [Facebook!][facebook].

### Thanks to

This project started as me grabbing scripts, mods and hacks to enhance my developer experience and happiness.
Over the time I based my configurations on this awesome resources: 

- [Git aliases](http://library.edgecase.com/git_immersion/lab_11.html).
- [Rails & Sinatra alias](http://openmonkey.com/2009/03/06/adaptive-script-console-shell-alias-for-both-rails-and-sinatra/) .
- [Rails 3 alias](http://matthewhutchinson.net/2010/9/19/rails-3-bash-aliases-and-irbrc-configs),  and [snippets](http://snippets.rorbuilder.info/posts/show/272).
- [Custom irb](http://iain.nl/2010/07/customizing-irb-2010-edition/), and [tips](http://robots.thoughtbot.com/post/159806033/irb-script-console-tips).

## TODO list

* Linux support.
* Add more goodies, rock like a pro.
* See this related project, maybe we could use/merge/decline: https://github.com/ryanb/dotfiles
* Enable donations.
* <del>Marry Megan Fox.</del>

[twitter]: http://twitter.com/mariozaizar
[facebook]: http://facebook.com/mariozaizar
[crowdint]: http://blog.crowdint.com
[amazon]: http://amzn.com/w/18ZQSVYATE5M1
[repo]: https://github.com/mariozaizar/dotfiles

[cli]: http://en.wikipedia.org/wiki/Command_line_interface
[markedit]: http://keshiki.net/markdown-editor/

[git]: http://git-scm.com/
[sinatra]: http://www.sinatrarb.com/
[rails]: http://rubyonrails.org/
[rvm]: https://rvm.beginrescueend.com/
[gem]: http://rubygems.org/
[bash]: http://www.gnu.org/software/bash/
[vagrant]: http://vagrantup.com