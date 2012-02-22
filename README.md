# dotFiles
A simple way to configure your bash as a real developer [terminal][cli].  
*by [Mario Zaizar](about)*

## Features

- [Bash][bash] custom developer promt, nice colors, useful aliases…
- [Git][git] default configuration, useful git alias, autocomplete by default, commit timer/log, promt…
- [Sinatra][sinatra] and [Ruby on Rails][rails] 2 & 3 smart alias (use the same for both).
- Default [rvm][rvm], [rubygems][gem] default settings, rvm gemset and ruby version in promt.
- [Vagrant][vagrant] getting box state directly in promt!

- **Editor and Terminal themes.**  
There is also a themes folder with some color skins for the most common apps,
like `iTerm`, `Terminal.app`, `Textmate`, `Sublime` and `RubyMine`.

![bash screenshoot](http://github.com/mariozaizar/dotfiles/raw/master/images/bash.jpg)
![editor screenshoot](http://github.com/mariozaizar/dotfiles/raw/master/images/editor.jpg)

## Requirements

- Mac OSX (Lion tested)
- Git ([git-scm.com](http://git-scm.com))
- GitHub account ([github.com](http://github.com))

## Installation

1) Get it!

	git clone https://github.com/mariozaizar/dotfiles.git;
    cd dotfiles;

2) Test it!

*Important:* in order to generate some files, you'll be asked to fill some
information like this:

- Full name, *Mario Zaizar*
- GitHub email, *mariozaizar@gmail.com*
- GitHub username, *mariozaizar*
- GitHub api token, *123456789012345678901234567890*
- Git projects directory, *~/Documents/Repositorios*

When you get ready with this information, run a simple test by:

    $ rake test

3) Install it!

*Note:* this will take your info to generate the new files like
`~/.gitconfig` and so, then it will copy this files inside your home directory
(and making backups if necessary).

    $ rake install
    $ source ~/.bash_profile

### Uninstall

*Important!* This is not ready yet. But at least you can restore the original files by removing the `*.old` extension.

<strike>
	$ rake uninstall
	$ source ~/.bash_profile
</strike>

## Contribute

[Report issues!](https://github.com/mariozaizar/dotfiles/issues?labels=Bugs) and
[suggest new features!](https://github.com/mariozaizar/dotfiles/issues?labels=Features)

## About

My name is [Mario Zaizar][about].  
This is my [twitter](twitter) (en español).  
Right now I'm working for [Crowd Interactive](crowd).

### Thanks

This project started as me grabbing scripts, mods and hacks to use better tools.
Over the time I based my configurations on this awesome resources:

- [Git aliases](http://library.edgecase.com/git_immersion/lab_11.html).
- Git promt:
[link1](http://tinyurl.com/4q6zehb)
[link2](https://gist.github.com/778558)
[link3](http://tinyurl.com/4kzgb7k)
- [Rails & Sinatra alias](http://openmonkey.com/2009/03/06/adaptive-script-console-shell-alias-for-both-rails-and-sinatra/). http://tinyurl.com/4j83zdv, http://tinyurl.com/2dq9pkv
- [Rails 3 alias](http://matthewhutchinson.net/2010/9/19/rails-3-bash-aliases-and-irbrc-configs),  and [snippets](http://snippets.rorbuilder.info/posts/show/272).
- [Custom irb](http://iain.nl/2010/07/customizing-irb-2010-edition/), and [tips](http://robots.thoughtbot.com/post/159806033/irb-script-console-tips).
- [Misc](https://gist.github.com/1270654)
- irb
[link1](http://iain.nl/2010/07/customizing-irb-2010-edition/)
[link2](http://snippets.rorbuilder.info/posts/show/272)
[link3](http://robots.thoughtbot.com/post/159806033/irb-script-console-tips)

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
