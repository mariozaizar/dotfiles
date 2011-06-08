# Welcome to Console-Pack!
_by [Mario Zaizar](twitter)_

A simple way to get the cool dev tools and console mods in your [console](cli) (terminal, iTerm, bash...) 

**Current feature list:**
- Developer [Bash](bash) promt, file listing colors. 
- [Git](git) default configuration, alias & enabled autocompletition.
- [Sinatra](sinatra) alias.
- [Ruby on Rails](rails) v2 and v3 smart alias
- Default [rvm](rvm), [rubygems](gem) settings

** Screenshoots: **
![screenshoots/1.png]
![screenshoots/2.png]
![screenshoots/3.png]

## Installation
Basically we add some files to your home folder, small ones will be replaced.
**Don't worry, we make backups** for your original files, so `original.txt` will be `original.txt.old`  

### Using Git
This is the recommended way.

    cd ~;
    git clone [https://github.com/mariozaizar/console-pack.git][repo];
    cd console-pack/;
    ./install.sh;

Restart your console, and **that's it!**
_**Note:** You can delete the console-pack folder after that._
	
## More info
> [Follow me!](twitter) or [stalk me!](facebook)
> Or even, [joing us!](crowdint)

### Thanks to
This project started as me grabbing scripts, mods and hacks to enhance my developer experience and happiness.
Over the time I based my configurations on this awesome resources: 

- Git <http://library.edgecase.com/git_immersion/lab_11.html>
- Sinatra <http://tinyurl.com/4j83zdv>
- Rails 2 & 3 alias <http://tinyurl.com/2dq9pkv>,  snippets <http://snippets.rorbuilder.info/posts/show/272>
- irb <http://iain.nl/2010/07/customizing-irb-2010-edition/>, <http://robots.thoughtbot.com/post/159806033/irb-script-console-tips>

[repo]: https://github.com/mariozaizar/console-pack.git
[twitter]: http://twitter.com/mariozaizar
[facebook]: http://facebook.com/mariozaizar
[crowdint]: http://crowdint.com

[cli]: http://en.wikipedia.org/wiki/Command_line_interface
[git]: http://git-scm.com/
[sinatra]: http://www.sinatrarb.com/
[rails]: http://rubyonrails.org/
[rvm]: https://rvm.beginrescueend.com/
[gem]: http://rubygems.org/
[bash]: http://www.gnu.org/software/bash/

## TODO list.
* Add a manual install instructions. Download and run perhaps?
* Linux support.
* Uninstaller support.
* Logo and Page.
* Other goodies.