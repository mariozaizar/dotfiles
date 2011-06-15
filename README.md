# [Console-Pack][repo], a simple way to get a real developer [console][cli].

## Features:

- [Bash][bash] developer promt, listing colors, useful aliases. 
- [Git][git] default configuration, git alias & autocomplete enabled.
- [Sinatra][sinatra] alias.
- [Ruby on Rails][rails] 2 & 3 smart alias.
- Default [rvm][rvm], [rubygems][gem] settings.
- Other example configuration files. 

## Installation

### Using Git

_This is the recommended way._
**We just provide example files**, in order to use them you should remove the "dot" from the name. so `dot.bash_profile` should be `.bash_profile`. _IMPORTANT: Please backup your original files before this, we don't want drama. For example `mv .bashprofile .bashprodile.old`_

```sh
    cd ~;
    git clone https://github.com/mariozaizar/console-pack.git;
    mv console-pack/files/* ~/;
    mv .file1 .file1.old; 
    mv dot.file1 .file1;
```

Restart your console, and that's it!. If you want uninstall it, just restore the *.old files.
_You can delete the console-pack folder after that._

## Screenshoots

![bash-1](http://github.com/mariozaizar/console-pack/raw/master/images/bash-1.jpg)
[Example I](http://github.com/mariozaizar/console-pack/raw/master/images/bash-1.jpg), [Example II](http://github.com/mariozaizar/console-pack/raw/master/images/bash-2.jpg)

## Full feature list

1. `.bash_aliases`
2. `.bash_profile`
This is the **main** file, and enables the others submodules. For example:
```sh
    # Developer promt
    if [ -f ~/.dev_promt.bash ]; then
    	. ~/.dev_promt.bash
    fi
```
3. `.dev_promt.bash`
Enables the developer bash promt and color listing. 

4. `.gemrc`
Don't install `ri` and `rdoc` by default.
Add `rubygems`, `github`, `rubyforge`, and `gemcutter` as default gem sources.
Set other default as: `verybose: true` or `benchmark: false`.

5. `.gitconfig`
Enable git aliases.

2. `.rvmrc`
Enable `rvm_pretty_print_flag`.

3. `~/.rvm.bash`
Enable rvm in Bash. ([rvm installation page][rvm])
 
### Other tools

* [MarkEdit][markedit] a really nice Markdown editor.

## Contribute

* [Report bugs!](https://github.com/mariozaizar/console-pack/issues?labels=Bugs)
* [Suggest new goodies!](https://github.com/mariozaizar/console-pack/issues?labels=Features)
* _Buy me a beer ([or something better][amazon])_

## About

### Project page: <https://github.com/mariozaizar/console-pack>, and [help](https://github.com/mariozaizar/console-pack/issues?labels=Help).
Follow me on [Twitter!][twitter], read [our blog][crowdint] or stalk me on [Facebook!][facebook].

### Thanks to

This project started as me grabbing scripts, mods and hacks to enhance my developer experience and happiness.
Over the time I based my configurations on this awesome resources: 

- [Git aliases](http://library.edgecase.com/git_immersion/lab_11.html).
- [Rails & Sinatra alias](http://openmonkey.com/2009/03/06/adaptive-script-console-shell-alias-for-both-rails-and-sinatra/) .
- [Rails 3 alias](http://matthewhutchinson.net/2010/9/19/rails-3-bash-aliases-and-irbrc-configs),  and [snippets](http://snippets.rorbuilder.info/posts/show/272).
- [Custom irb](http://iain.nl/2010/07/customizing-irb-2010-edition/), and [tips](http://robots.thoughtbot.com/post/159806033/irb-script-console-tips).

## TODO list

* Installation/Uninstaller script. Something like Homebrew does, `/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"`
* Linux support.
* Logo and Page
* Run [MarkEdit][markedit] from command line.
* Other goodies.
* Add other tools, like the vim powerpack.
* Enable donations.
* <del>Marry Megan Fox.</del>

[twitter]: http://twitter.com/mariozaizar
[facebook]: http://facebook.com/mariozaizar
[crowdint]: http://blog.crowdint.com
[amazon]: http://amzn.com/w/18ZQSVYATE5M1
[repo]: https://github.com/mariozaizar/console-pack.git;

[cli]: http://en.wikipedia.org/wiki/Command_line_interface
[markedit]: http://keshiki.net/markdown-editor/

[git]: http://git-scm.com/
[sinatra]: http://www.sinatrarb.com/
[rails]: http://rubyonrails.org/
[rvm]: https://rvm.beginrescueend.com/
[gem]: http://rubygems.org/
[bash]: http://www.gnu.org/software/bash/
