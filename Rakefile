require 'rake'
require 'erb'

HOME_DIR = File.expand_path('~')

FILES = {
  :dotfiles => {
    "files/bash/aliases.sh"           => "~/.bash/aliases",
    "files/bash/completion.sh"        => "~/.bash/completion",
    "files/bash/config.sh"            => "~/.bash/config",
    "files/bash/prompt.sh"            => "~/.bash/prompt",
    "files/bash_profile.sh"           => "~/.bash_profile",
    "files/bashrc.sh"                 => "~/.bashrc",
    "files/gemrc.yml"                 => "~/.gemrc",
    "files/gitconfig.ini"             => "~/.gitconfig",
    "files/gitignore"                 => "~/.gitignore",
    "files/guardfile.rb"              => "~/.Guardfile",
    "files/hgignore_global"           => "~/.hgignore_global",
    "files/powconfig.sh"              => "~/.powconfig",
    "files/rspec.rb"                  => "~/.rspec",
    "files/rvmrc.sh"                  => "~/.rvmrc",
    "files/smb.conf.ini"              => "~/.smb/smb.conf",
    "files/vimrc.sh"                  => "~/.vimrc" },

  :sublime => {
    "files/sublime/gist.json"         => "~/Library/Application Support/Sublime Text 3/Packages/Gist/Gist.sublime-settings",
    "files/sublime/keymap.json"       => "~/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap",
    "files/sublime/packages.json"     => "~/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings",
    "files/sublime/settings.json"     => "~/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
  }
}

LINKS = {
  "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" => "/usr/bin/subl",
  "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone Simulator.app" => "/Applications/iPhoneSimulator.app"
}

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

  `brew update`
  `brew install mysql wget rbenv` 
  `brew tap universal-ctags/universal-ctags`
  `brew install --HEAD universal-ctags`
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

namespace :configure do
  desc "Configures Sublime Text Editor"
  task :sublime do
    list_files :sublime
    exit if ask("\nContinue? [Y/N]: ", false)!='Y'

    create_files :sublime
    reload_bash
  end

  # desc "Creates symbolic links"
  task :links do
    create_links
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
