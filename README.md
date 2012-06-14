# dotFiles
A simple way to configure your bash shell as developer [terminal][cli].  
*by [Mario Zaizar](about)*

![editor screenshoot](http://github.com/mariozaizar/dotfiles/raw/master/images/promt_complete.png)

## Features

- [Bash][bash] custom developer promt, nice colors, useful aliases…
- [Git][git] default configuration, useful git alias, autocomplete by default, commit timer/log, promt…
- [Sinatra][sinatra] and [Ruby on Rails][rails] 2 & 3 smart alias (use the same for both).
- [Ruby][ruby], [irb][irb] and [rubygems][gem] default settings.
- Ruby versions like [rvm][rvm], [rbenv][rbenv] inside your promt.
- Default [rvm][rvm], [rubygems][gem] default settings, rvm gemset and ruby version in promt.
- [Vagrant][vagrant] getting box state directly in promt!

- **Editor and Terminal themes.**  
There is also a themes folder with some color skins for the most common apps,
like `iTerm`, `Terminal.app`, `Textmate`, `Sublime` and `RubyMine`.

This is the current list of files:

    ~/.bash_aliases
    ~/.bash_completion
    ~/.bash_config
    ~/.bash_promt
    ~/.bash_profile
    ~/.bashrc
    ~/.diffmerge.sh
    ~/.gemrc
    ~/.gitconfig
    ~/.gitignore
    ~/.Guardfile
    ~/.hgignore_global
    ~/.irbrc
    ~/.rvmrc
    ~/.smb/smb.conf
    ~/Library/Application Support/Sublime Text 2/Packages/Gist/Gist.sublime-settings
    ~/Library/Application Support/Sublime Text 2/Packages/User/Default (OSX).sublime-keymap
    ~/Library/Application Support/Sublime Text 2/Packages/User/Package Control.sublime-settings"
    ~/Library/Application Support/Sublime Text 2/Packages/User/Base File.sublime-settings
    ~/.vimrc

![rbenv screenshoot](http://github.com/mariozaizar/dotfiles/raw/master/images/promt_simple.png)
> The default promt is pretty simple:

## Requirements

- Mac OSX (Lion tested)
- Git ([git-scm.com](http://git-scm.com))
- GitHub account ([github.com](http://github.com))
- Ruby installed (also rake) ([ruby-lang.org](http://www.ruby-lang.org/en/))

## Installation

### 1) Get it!

    git clone https://github.com/mariozaizar/dotfiles.git;
    cd dotfiles;

![rake](http://github.com/mariozaizar/dotfiles/raw/master/images/rake.png)
> Type rake -T to see the available commands:

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

This will show a list with all the files and full paths. But also including a
preview of the file content.

### 3) Install it!

*Note:* this will generate the files (for example `~/.gitconfig`) and then it
will copy this files inside your home directory (making backups if necessary).

    $ rake install
    $ source ~/.bash_profile

#### Uninstall

*Important!* This is not fully implemented. But at least you will see how to
restore the original files by removing the `*.old` extension.

    $ rake uninstall

![uninstall](http://github.com/mariozaizar/dotfiles/raw/master/images/uninstall.png)
> Uninstall example

## Other links

- [Sublime Package Control](http://wbond.net/sublime_packages/package_control/installation)
- [Cucumber Bundle for Sublime](http://github.com/npverni/cucumber-sublime2-bundle)

## Contribute

[Report issues!](https://github.com/mariozaizar/dotfiles/issues?labels=Bugs) and
[suggest new features!](https://github.com/mariozaizar/dotfiles/issues?labels=Features)

## About

My name is [Mario Zaizar][about].  
This is my [twitter][twitter] (en español).  
I work for [Crowd Interactive][crowd].

### Thanks

This project started as me grabbing scripts, mods and hacks to use better tools.
Over the time I based my configurations on this awesome resources:

[Ryan Bates dotFiles](https://github.com/ryanb/dotfiles), 
[Git aliases](http://library.edgecase.com/git_immersion/lab_11.html), 
Git promt: [link1](http://tinyurl.com/4q6zehb), [link2](https://gist.github.com/778558), [link3](http://tinyurl.com/4kzgb7k), 
[Rails & Sinatra alias](http://openmonkey.com/2009/03/06/adaptive-script-console-shell-alias-for-both-rails-and-sinatra/), <http://tinyurl.com/2dq9pkv>, 
[Rails 3 alias](http://matthewhutchinson.net/2010/9/19/rails-3-bash-aliases-and-irbrc-configs),  and [snippets](http://snippets.rorbuilder.info/posts/show/272), 
[Custom irb](http://iain.nl/2010/07/customizing-irb-2010-edition/), and [tips](http://robots.thoughtbot.com/post/159806033/irb-script-console-tips), 
[Alias from @dabit](https://gist.github.com/1270654), 
[Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles), 
[Mathias Bynens dotfiles](https://github.com/mathiasbynens/dotfiles/), 
My [CrowdInt][crowd] friends

[about]: http://about.me/mariozaizar
[twitter]: http://twitter.com/mariozaizar
[crowd]: http://blog.crowdint.com
[cli]: http://en.wikipedia.org/wiki/Command_line_interface
[git]: http://git-scm.com/
[sinatra]: http://www.sinatrarb.com/
[ruby]: http://ruby-lang.org/
[rails]: http://rubyonrails.org/
[rvm]: https://rvm.beginrescueend.com/
[rbenv]: https://github.com/sstephenson/rbenv
[gem]: http://rubygems.org/
[bash]: http://www.gnu.org/software/bash/
[vagrant]: http://vagrantup.com
[irb]: http://en.wikipedia.org/wiki/Interactive_Ruby_Shell
