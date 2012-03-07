require 'rake'
require 'erb'

HOME_DIR = File.expand_path('~')

FILES = {
  "files/bash/aliases.sh"         => "~/.bash_aliases",
  "files/bash/completion.sh"      => "~/.bash_completion",
  "files/bash/config.sh"          => "~/.bash_config",
  "files/bash/promt.sh"           => "~/.bash_promt",
  "files/bash_profile.sh"         => "~/.bash_profile",
  "files/bashrc.sh"               => "~/.bashrc",
  "files/diffmerge.sh"            => "~/.diffmerge.sh",
  "files/gemrc.yml"               => "~/.gemrc",
  "files/gitconfig.ini"           => "~/.gitconfig",
  "files/gitignore"               => "~/.gitignore",
  "files/hgignore_global"         => "~/.hgignore_global",
  "files/irbrc.rb"                => "~/.irbrc",
  "files/rvmrc.sh"                => "~/.rvmrc",
  "files/smb.conf.ini"            => "~/.smb/smb.conf",
  "files/sublime/keymap.json"     => "~/Library/Application Support/Sublime Text 2/Packages/User/Default (OSX).sublime-keymap",
  "files/sublime/settings.json"   => "~/Library/Application Support/Sublime Text 2/Packages/User/Base File.sublime-settings",
  "files/sublime/gist.json"       => "~/Library/Application Support/Sublime Text 2/Packages/Gist/Gist.sublime-settings",
  "files/sublime/packages.json"   => "~/Library/Application Support/Sublime Text 2/Packages/User/Package Control.sublime-settings"
}

LINKS = {
  "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" => "/usr/bin/subl",
  "~/.diffmerge.sh" => "/usr/bin/diffmerge"
}

def get_user_information
  puts "\nPlease write your information:"

  @full_name        = ask(" - Your full name: ")
  @github_user      = ask(" - GitHub username: ")
  @github_email     = ask(" - GitHub email: ")
  @github_password  = ask(" - GitHub password: ")
  @github_token     = ask(" - GitHub api token: ")
  @projects_dir     = ask(" - Projects directory. Like `~/Projects`: ")

  puts "\nHello! #{@full_name}"
  exit if ask("Continue? y/n: ", false)!='y'
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

def create_links testing=true
  puts "\nCreate #{LINKS.count} symbolic links:"

  LINKS.each do |from, to|
    puts "\n - Linking #{from} to #{to}"
    to.gsub!('~', HOME_DIR)

    if File.exist?(from) && !File.exist?(to)
      system %Q{ln -s "#{from}" "#{to}"} unless testing
    else
      puts "   Abort: destination already exists!" if File.exist?(to)
      puts "   Abort: origin file doesn't exist!" unless File.exist?(from)
    end
  end
end

def create_files testing=true
  puts "\nReplace #{FILES.count} files:"

  FILES.each do |from, to|
    puts "\n - Moving #{from} to #{to}"
    to.gsub!('~', HOME_DIR)

    if File.exist?(to)
      puts "   Warning: #{to} exists!"
      puts "   Info: backup created at: #{to}.old"

      unless File.exist?("#{to}.old")
        system %Q{cp "#{to}" "#{to}.old"} unless testing
      else
        puts "   Abort: backup already exists!"
      end
    end

    content = ERB.new(File.read(from)).result(binding)
    if testing
      puts "   File content:"
      puts "\n"
      puts "-------------------------------------------------------------------"
      puts "#{content}"
      puts "-------------------------------------------------------------------"
      puts "\n"
    end

    File.open(to, 'w') do |new_file|
      new_file.write content
    end unless testing
  end
end

################################################################################
desc "Just test and print the results, Don't do anything yet."
################################################################################
task :test do
  get_user_information
  create_files
  create_links
end

################################################################################
desc "Install the dot files into user's home directory and create symbolic links."
################################################################################
task :install do
  get_user_information
  create_files false
  create_links false
  system %Q{source ~/.bash_profile}

  puts "\nIf you like it, click here: http://goo.gl/QF88m"
  puts "-Mario"
end

################################################################################
desc "Uninstall this! move back the .old files as normal!"
################################################################################
task :uninstall do
  puts "SORRY FOR ANY TROUBLE. But don't worry, your original files are safe."
  puts "Just remove the '.old' extension from all of this files:\n\n"

  system %Q{find ~ -name "*.old"}

  puts "\nAnd then restart your terminal."
  puts "-Mario"
end
