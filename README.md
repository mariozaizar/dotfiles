# dotFiles
A simple way to configure your bash as a real developer [terminal][cli].  
*by [Mario Zaizar](about)*

![bash screenshoot](http://github.com/mariozaizar/dotfiles/raw/master/images/bash.png)
## Features

- [Bash][bash] custom developer promt, nice colors, useful aliases…
- [Git][git] default configuration, useful git alias, autocomplete by default, commit timer/log, promt…
- [Sinatra][sinatra] and [Ruby on Rails][rails] 2 & 3 smart alias (use the same for both).
- Default [rvm][rvm], [rubygems][gem] default settings, rvm gemset and ruby version in promt.
- [Vagrant][vagrant] getting box state directly in promt!

- **Editor and Terminal themes.**  
There is also a themes folder with some color skins for the most common apps,
like `iTerm`, `Terminal.app`, `Textmate`, `Sublime` and `RubyMine`.

![editor screenshoot](http://github.com/mariozaizar/dotfiles/raw/master/images/editor.png)
This is the current list of files:

    ~/.bash_aliases
    ~/.bash_completion
    ~/.bash_promt
    ~/.bash_tweeks
    ~/.bash_profile
    ~/.bashrc
    ~/.diffmerge.sh
    ~/.gemrc
    ~/.gitconfig
    ~/.gitignore
    ~/.hgignore_global
    ~/.irbrc
    ~/.rvmrc
    ~/.smb/smb.conf
    ~/Library/Application Support/Sublime Text 2/Packages/User/Default (OSX).sublime-keymap
    ~/Library/Application Support/Sublime Text 2/Packages/User/Base File.sublime-settings"

## Requirements

- Mac OSX (Lion tested)
- Git ([git-scm.com](http://git-scm.com))
- GitHub account ([github.com](http://github.com))

## Installation

### 1) Get it!

    git clone https://github.com/mariozaizar/dotfiles.git;
    cd dotfiles;

### 2) Test it!

*Important:* in order to generate some files, you'll be asked to fill some
information like this:

    - Full name, *Mario Zaizar*
    - GitHub email, *mariozaizar@gmail.com*
    - GitHub username, *mariozaizar*
    - GitHub api token, *123456789012345678901234567890*
    - Git projects directory, *~/Documents/Repositorios*

When you get ready with this information, run a simple test by:

    $ rake test

![test screenshoot](http://github.com/mariozaizar/dotfiles/raw/master/images/test.png)

### 3) Install it!

*Note:* this will take your info to generate the new files like
`~/.gitconfig` and so, then it will copy this files inside your home directory
(and making backups if necessary).

    $ rake install
    $ source ~/.bash_profile

#### Uninstall

*Important!* This is not fully implemented. But at least you will see how to
restore the original files by removing the `*.old` extension.

    $ rake uninstall

## Contribute

[Report issues!](https://github.com/mariozaizar/dotfiles/issues?labels=Bugs) and
[suggest new features!](https://github.com/mariozaizar/dotfiles/issues?labels=Features)

### Support

**[Click here if you like it!](http://goo.gl/QF88m)**

## About

My name is [Mario Zaizar][about].  
This is my [twitter](twitter) (en español).  
I work for [Crowd Interactive](crowd).

### Thanks

This project started as me grabbing scripts, mods and hacks to use better tools.
Over the time I based my configurations on this awesome resources:

- [Ryan Bates dotFiles](https://github.com/ryanb/dotfiles)
- [Git aliases](http://library.edgecase.com/git_immersion/lab_11.html).
- Git promt: [link1](http://tinyurl.com/4q6zehb), [link2](https://gist.github.com/778558), [link3](http://tinyurl.com/4kzgb7k)
- [Rails & Sinatra alias](http://openmonkey.com/2009/03/06/adaptive-script-console-shell-alias-for-both-rails-and-sinatra/), http://tinyurl.com/2dq9pkv
- [Rails 3 alias](http://matthewhutchinson.net/2010/9/19/rails-3-bash-aliases-and-irbrc-configs),  and [snippets](http://snippets.rorbuilder.info/posts/show/272).
- [Custom irb](http://iain.nl/2010/07/customizing-irb-2010-edition/), and [tips](http://robots.thoughtbot.com/post/159806033/irb-script-console-tips).
- [Alias from @dabit](https://gist.github.com/1270654)

[about]: http://about.me/mariozaizar
[twitter]: http://twitter.com/mariozaizar
[crowdint]: http://blog.crowdint.com
[cli]: http://en.wikipedia.org/wiki/Command_line_interface
[git]: http://git-scm.com/
[sinatra]: http://www.sinatrarb.com/
[rails]: http://rubyonrails.org/
[rvm]: https://rvm.beginrescueend.com/
[gem]: http://rubygems.org/
[bash]: http://www.gnu.org/software/bash/
[vagrant]: http://vagrantup.com
