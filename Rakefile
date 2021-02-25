require 'rake'
require 'erb'

HOME_DIR = File.expand_path('~')

LINKS = {
  "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" =>
    "/usr/local/bin/sublime",
  "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" =>
    "/usr/local/bin/smerge"
}

FILES = {
  :dotfiles => {
    "files/atom/config.cson"           => "~/.atom/config.cson",
    "files/atom/keymap.cson"           => "~/.atom/keymap.cson",
    "files/aws-credentials.yml"        => "~/.aws/credentials",
    "files/bash_profile.sh"            => "~/.bash_profile",
    "files/dotfiles.sh"                => "~/.dotfiles",
    "files/bashrc.sh"                  => "~/.bashrc",
    "files/bundle_config.ini"          => "~/.bundle/config",
    "files/gemrc.yml"                  => "~/.gemrc",
    "files/gitconfig.ini"              => "~/.gitconfig",
    "files/gitignore"                  => "~/.gitignore",
    "files/hgignore_global"            => "~/.hgignore_global",
    "files/hub.zsh_completion.sh"      => "~/.zsh/completions/hub.zsh_completion",
    "files/rbenv-default-gems.rb"      => "~/.rbenv/default-gems",
    "files/rspec.rb"                   => "~/.rspec",
    "files/ruby-gemset"                => "~/Code/.ruby-gemset",
    "files/ruby-version"               => "~/Code/.ruby-version",
    "files/smb.conf.ini"               => "~/.smb/smb.conf",
    "files/stCommitMsg.txt"            => "~/.stCommitMsg",
    "files/sublime/keymap.json"        => "~/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap",
    "files/sublime/settings.json"      => "~/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings",
    "files/iterm2/switch_automatic.py" => "~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch/switch_automatic.py",
    "files/vimrc.sh"                   => "~/.vimrc",
    "files/zshrc.sh"                   => "~/.zshrc"
  },
}

################################################################################
def get_user_information
  puts "\nPlease write your information:"

  @full_name        = ask(" - Your full name: ")
  @github_user      = ask(" - GitHub username: ")
  @github_email     = ask(" - GitHub email: ")
  @projects_dir     = ask(" - Work directory. Like `~/Code`: ")

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
  LINKS.each do |from, to|
    puts "\t#{from} => #{to}"
    to.gsub!('~', HOME_DIR)

    if File.exist?(from) && !File.exist?(to)
      system %Q{ln -s "#{from}" "#{to}"}
    else
      puts "The destination already exists: #{to}" if File.exist?(to)
      puts "The origin file doesn't exist: #{from}" unless File.exist?(from)
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
    if File.exist?(to) && !File.exist?("#{to}.dotfiles-backup")
      system %Q{cp "#{to}" "#{to}.dotfiles-backup"}
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
  puts "Please reload your terminal"
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

namespace :install do
  desc "Create some sublinks"
  task :links do
    create_links
    reload_bash
  end
end

desc "Where to find the backup files"
task :uninstall do
  puts "Your original files are safe as *.dotfiles-backup files."
  puts "Searching for *.dotfiles-backup files:\n\n"
  system %Q{ find ~ -name "*.dotfiles-backup" }

  puts "\nJust remove the '.dotfiles-backup' extension and restart your terminal."
end

task :default => :help
