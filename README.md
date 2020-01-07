# dotFiles
A simple way to configure your bash shell as developer [terminal][cli].

## Features

- [Bash][bash] custom developer prompt, nice colors, useful aliases…
- [Git][git] default configuration, useful git alias, autocomplete by default, commit timer/log, prompt…
- [Sinatra][sinatra] and [Ruby on Rails][rails] 2 & 3 smart alias (use the same for both).
- [Ruby][ruby], and [rubygems][gem] default settings.
- Ruby versions like [rbenv][rbenv] inside your prompt.
- Default [rubygems][gem] default settings, gemset and ruby version in prompt.

This is the current list of files:

*dotfiles:*
```
~/.bash/aliases
~/.bash/completion
~/.bash/config
~/.bash/prompt
~/.bash_profile
~/.bashrc
~/.gemrc
~/.gitconfig
~/.gitignore
~/.Guardfile
~/.guardrc
~/.hgignore_global
~/.rspec
~/.smb/smb.conf
~/.vimrc
```

## Requirements

- Mac OSX
- Git ([git-scm.com](http://git-scm.com))
- GitHub account ([github.com](http://github.com))
- System's Ruby (also rake) ([ruby-lang.org](http://www.ruby-lang.org/en/))

## Installation

### Get it!

    $ git clone https://github.com/mariozaizar/dotfiles.git;
    $ cd dotfiles/;
    $ rake help;

### Install it!

*Note:* this will generate the files (for example `~/.gitconfig`) and then it
will copy this files inside your home directory (making backups if necessary).
So, that means that we will REPLACE the original files, but creating a backup
with `*.old` extension. Please go to 'Uninstall" section to see how to recover
your original files.

    $ rake install

### Uninstall

    $ rake uninstall

[cli]: http://en.wikipedia.org/wiki/Command_line_interface
[git]: http://git-scm.com/
[sinatra]: http://www.sinatrarb.com/
[ruby]: http://ruby-lang.org/
[rails]: http://rubyonrails.org/
[rvm]: https://rvm.beginrescueend.com/
[rbenv]: https://github.com/sstephenson/rbenv
[gem]: http://rubygems.org/
[bash]: http://www.gnu.org/software/bash/
