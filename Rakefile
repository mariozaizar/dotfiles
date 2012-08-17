require 'rake'
require 'erb'

HOME_DIR = File.expand_path('~')

FILES = {
  :dotfiles => {
    "files/bash/aliases.sh"           => "~/.bash_aliases",
    "files/bash/completion.sh"        => "~/.bash_completion",
    "files/bash/config.sh"            => "~/.bash_config",
    "files/bash/prompt.sh"            => "~/.bash_prompt",
    "files/bash_profile.sh"           => "~/.bash_profile",
    "files/bashrc.sh"                 => "~/.bashrc",
    "files/gemrc.yml"                 => "~/.gemrc",
    "files/gitconfig.ini"             => "~/.gitconfig",
    "files/gitignore"                 => "~/.gitignore",
    "files/guardfile.rb"              => "~/.Guardfile",
    "files/hgignore_global"           => "~/.hgignore_global",
    "files/irbrc.rb"                  => "~/.irbrc",
    "files/rvmrc.sh"                  => "~/.rvmrc",
    "files/smb.conf.ini"              => "~/.smb/smb.conf",
    "files/vimrc.sh"                  => "~/.vimrc" },

  :sublime => {
    "files/sublime/gist.json"         => "~/Library/Application Support/Sublime Text 2/Packages/Gist/Gist.sublime-settings",
    "files/sublime/keymap.json"       => "~/Library/Application Support/Sublime Text 2/Packages/User/Default (OSX).sublime-keymap",
    "files/sublime/packages.json"     => "~/Library/Application Support/Sublime Text 2/Packages/User/Package Control.sublime-settings",
    "files/sublime/settings.json"     => "~/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings",
    "files/sublime/jslint.json"       => "~/Library/Application Support/Sublime Text 2/Packages/sublime-jslint/sublime-jslint.sublime-settings",
    "files/sublime/test_chooser.json" => "~/Library/Application Support/Sublime Text 2/Packages/TestChooser/TestChooser.sublime-settings"
  }
}

LINKS = {
  "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" => "/usr/bin/subl",
  "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone Simulator.app" => "/Applications/iPhoneSimulator.app"
}

################################################################################
def get_user_information
  puts "\nPlease write your information:"

  @full_name        = ask(" - Your full name: ")
  @github_user      = ask(" - GitHub username: ")
  @github_email     = ask(" - GitHub email: ")
  @projects_dir     = ask(" - Projects directory. Like `~/Projects`: ")

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
  puts "\nCreate #{LINKS.count} symbolic links:"

  LINKS.each do |from, to|
    puts "\n - Linking #{from} to #{to}"
    to.gsub!('~', HOME_DIR)

    if File.exist?(from) && !File.exist?(to)
      system %Q{ln -s "#{from}" "#{to}"}
    else
      puts "   Abort: destination already exists!" if File.exist?(to)
      puts "   Abort: origin file doesn't exist!" unless File.exist?(from)
    end
  end
end

def list_files group
  puts "\n#{group}:"
  FILES[group].values.each do |value|
    puts "\t#{value}"
  end
end

def create_files group
  puts "\nReplace #{FILES[group].count} files:"
  FILES[group].each do |from, to|

    # Abort if the destination parent folder doesn't exists, like when
    # "~/Library/Application Support/Sublime Text 2/" is not installed at all
    next unless File.exist?(File.expand_path(File.dirname(to)))

    puts "\n - Moving #{from} to #{to}"
    to.gsub!('~', HOME_DIR)

    if File.exist?(to)
      puts "   Warning: #{to} exists!"
      puts "   Info: backup created at: #{to}.old"

      unless File.exist?("#{to}.old")
        system %Q{cp "#{to}" "#{to}.old"}
      else
        puts "   Abort: backup already exists!"
      end
    end

    content = ERB.new(File.read(from)).result(binding)
    File.open(to, 'w') do |new_file|
      new_file.write content
    end
  end
end

def reload_bash
  system %Q{source ~/.bash_profile}
end

################################################################################
desc "Help"
task :help do
  puts "We will replace this files (creating a backup first):"
  [ :dotfiles, :sublime ].each do |group|
    list_files group
  end
end

desc "At user's home directory"
task :install do
  get_user_information

  list_files group :dotfiles
  exit if ask("Continue? y/n: ", false)!='y'

  create_files :dotfiles
  reload_bash
end

namespace :install do
  desc "Configures Sublime Text Editor"
  task :sublime do
    list_files group :sublime
    exit if ask("Continue? y/n: ", false)!='y'

    create_files :sublime
    reload_bash
  end

  desc "Creates symbolic links"
  task :links do
    exit if ask("Continue? y/n: ", false)!='y'

    create_links
    reload_bash
  end
end

desc "Where to find the backup files"
task :uninstall do
  puts "Your original files are safe as *.old files."
  puts "Searching for *.old files:\n\n"
  system %Q{find ~ -name "*.old"}

  puts "\nJust remove the '.old' extension and restart your terminal."
  puts "-Mario"
end
