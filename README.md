# dotFiles

A simple way to configure your bash [terminal][cli] as a real developer console.

*by [Mario Zaizar](about)*

## Features

- [Bash][bash] developer promt, colors, aliases…
- [Git][git] default configuration, alias, autocomplete, commit timer, promt…
- [Sinatra][sinatra] and [Ruby on Rails][rails] 2 & 3 smart alias.
- Default [rvm][rvm], [rubygems][gem] settings, rvm gemset and ruby promt.
- [Vagrant][vagrant] promt!
- Many others...

### Themes

There is also a `themes` folder with some color skins for the most common apps,
like iTerm, Terminal.app, Textmate, Sublime and Ruby Mine.

## Requirements

- Mac OSX (tested in Lion)
- Git (git-scm.com)
- Ruby (ruby-lang.org)
- Bash (never tested with zsh)
- GitHub account (github.com)

## Installation

1) Get it!

	git clone https://github.com/mariozaizar/dotfiles.git;
    cd dotfiles;

2) Edit the `Rakefile`, and fill this variables with your own information.  
For example: 

	USER_NAME     = 'Your Name' 
	USER_EMAIL    = 'you@email.com'
	GITHUB_USER   = 'githubuser'
	GITHUB_TOKEN  = 'yourtoken123456789012345678901234567890' # keep this secret!
	PROJECTS_DIR  = '~/Documents/Projects/'

3) Test it!  
Look around, feel comfortable with it.

    $ rake test

4) Install it!  

*Note:* this will take your info and generate the new files like 
`~/.bash_profile`, then it will copy this files inside your home directory 
(making backups if neccesary)

    $ rake install
    $ source ~/.bash_profile

### Uninstall

	$ rake uninstall
	$ source ~/.bash_profile

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

---

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
