require 'rake'
require 'erb'

HOME_DIR = File.expand_path('~')

FILES = {
  :dotfiles => {
    "files/bash_profile.sh"           => "~/.bash_profile",
    "files/bash/aliases.sh"           => "~/.bash/aliases",
    "files/bash/completion.sh"        => "~/.bash/completion",
    "files/bash/config.sh"            => "~/.bash/config",
    "files/bash/prompt.sh"            => "~/.bash/prompt",
    "files/bashrc.sh"                 => "~/.bashrc",
    "files/gemrc.yml"                 => "~/.gemrc",
    "files/gitconfig.ini"             => "~/.gitconfig",
    "files/irbrc.ini"                 => "~/.irbrc",
    "files/pryrc.ini"                 => "~/.pryrc",
    "files/gitignore"                 => "~/.gitignore",
    "files/guardfile.rb"              => "~/.Guardfile",
    "files/hgignore_global"           => "~/.hgignore_global",
    "files/bundle_config"             => "~/.bundle/config",
    "files/zshrc"                     => "~/.zshrc",
    "files/hub.zsh_completion.sh"     => "~/.zsh/completions/hub.zsh_completion",
    "files/oh-my-zsh"                 => "~/.oh-my-zsh",
    "files/powconfig.sh"              => "~/.powconfig",
    "files/rspec.rb"                  => "~/.rspec",
    "files/ruby-gemset"               => "~/Projects/.ruby-gemset",
    "files/ruby-version"              => "~/Projects/.ruby-version",
    "files/git-push-request.rb"       => "~/.git-push-request.rb",
    "files/rvmrc.sh"                  => "~/.rvmrc",
    "files/smb.conf.ini"              => "~/.smb/smb.conf",
    "files/styles.less"               => "~/.atom/styles.less",
    "files/vimrc.sh"                  => "~/.vimrc",
    "files/sublime/keymap.json"       => "~/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap",
    "files/sublime/settings.json"     => "~/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
  },
}

# NOTE: First install https://packagecontrol.io/ then run "advance install" and paste:
# Alignment, Better CoffeeScript, Better RSpec, Case Conversion, ChangeQuotes, Cucumber, Devastate, Git, GitGutter, GitHubinator, Haml, MarkdownLight, Material Theme, RSpec, RSpecNavigator, Sass, SideBarEnhancements, Solarized Color Scheme, Syntax Highlighting for Sass, Theme - Flatland, Theme - Glacier, Theme - Spacegray, Theme - Tech49, Themr, TrailingSpaces


################################################################################
def get_user_information
  puts "\nPlease write your information:"

  @full_name        = ask(" - Your full name: ")
  @github_user      = ask(" - GitHub username: ")
  @github_email     = ask(" - GitHub email: ")
  @projects_dir     = ask(" - Work directory. Like `~/Projects`: ")

  puts "\nHello! #{@full_name}"
end

def ask message="", required=true
  print message
  data = STDIN.gets.chomp

  if data=="" && required
    puts "Aborted. This field can't be blank."
    exit
  end

  data
end

def create_links
  LINKS.sort!.each do |from, to|
    puts "\t#{from} => #{to}"
    to.gsub!('~', HOME_DIR)

    if File.exist?(from) && !File.exist?(to)
      system %Q{ln -s "#{from}" "#{to}"}
    else
      puts "Abort: destination already exists!" if File.exist?(to)
      puts "Abort: origin file doesn't exist!" unless File.exist?(from)
    end
  end
end

def create_files group
  FILES[group].each do |from, to|
    puts "\t#{from} => #{to}"
    to.gsub!('~', HOME_DIR)

    # Folders
    folder = File.expand_path(File.dirname(to))
    system %Q{ mkdir -p "#{folder}"} unless File.exist?(folder)

    # Backup
    if File.exist?(to) && !File.exist?("#{to}.old")
      system %Q{cp "#{to}" "#{to}.old"}
    end

    # Content
    content = ERB.new(File.read(from)).result(binding)
    File.open(to, 'w') do |new_file|
      new_file.write content
    end
  end
end

def list_files group
  puts "Going to replace this files:"
  FILES[group].values.sort!.each do |value|
    puts "\t#{value}"
  end
end

def reload_bash
  system %Q{ bash }
end

################################################################################
desc "Help"
task :help do
  puts "Please execute rake -T to see the available commands."
end

desc "At user's home directory"
task :install do
  get_user_information

  list_files :dotfiles
  exit if ask("\nContinue? [Y/N]: ", false)!='Y'

  create_files :dotfiles
  reload_bash
end

desc "Install some Brews"
task :install_brew do
  puts "Will install some basic brews (you need brew installed)"
  exit if ask("\nContinue? [Y/N]: ", false)!='Y'

  # Basics
  `brew update`
  `brew install mysql wget rbenv zsh curl openssl hub`
  `brew link openssl --force`

  # CodeCliamte for Atom editor.
  `brew tap codeclimate/formulae`
  `brew install codeclimate`
end

namespace :install do
  desc "Same as Install, but without asking anything. Quick and easy."
  task :no_ask do
    @full_name        = "Developer"
    @github_user      = ""
    @github_email     = ""
    @projects_dir     = "~/Projects"

    create_files :dotfiles
    reload_bash
  end
end

desc "Where to find the backup files"
task :uninstall do
  puts "Your original files are safe as *.old files."
  puts "Searching for *.old files:\n\n"
  system %Q{ find ~ -name "*.old" }

  puts "\nJust remove the '.old' extension and restart your terminal."
  puts "-Mario"
end

task :default => :help
