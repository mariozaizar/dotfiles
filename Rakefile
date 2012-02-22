require 'rake'
require 'erb'

HOME_DIR = File.expand_path('~')

FILES = {
  "files/bash/aliases.sh"         => "~/.bash_aliases",
  "files/bash/completion.sh"      => "~/.bash_completion",
  "files/bash/promt.sh"           => "~/.bash_promt",
  "files/bash_profile.sh"         => "~/.bash_profile",
  "files/bashrc.sh"               => "~/.bashrc",
  "files/diffmerge.sh"            => "~/.diffmerge.sh",
  "files/gemrc.yml"               => "~/.gemrc",
  "files/gitconfig.ini"           => "~/.gitconfig",
  "files/gitignore"               => "~/.gitignore",
  "files/irbrc.rb"                => "~/.irbrc",
  "files/rvmrc.sh"                => "~/.rvmrc",
  "files/smb.conf.ini"            => "~/.smb/smb.conf",
  "files/sublime-settings.json"   => "~/Library/Application Support/Sublime Text 2/Packages/User/Base File.sublime-settings"
}

LINKS = {
  "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" => "/usr/bin/subl"
}

def get_user_information
  puts "\nPlease write your information:"

  @full_name    = ask(" - Your full name: ")
  @github_email = ask(" - GitHub email: ")
  @github_user  = ask(" - GitHub username: ")
  @github_token = ask(" - GitHub api token: ")
  @projects_dir = ask(" - Projects directory: ")

  puts "Welcome #{@full_name}!"
  exit if ask("Continue? Y/n: ")!='Y'
end

def ask message="Press any key to continue."
  print message
  STDIN.gets.chomp
end

def create_links testing=true
  puts "\nCreate #{LINKS.count} symbolic links:"

  LINKS.each do |from, to|
    puts " - Linking #{from} to #{to}"

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
    puts " - #{from} to #{to}"
    to.gsub!('~', HOME_DIR)

    if File.exist?(to)
      puts "   Warning: #{to} exists! Create a backup file."
      system %Q{cp "#{to}" "#{to}.old"} unless testing
    end

    content = ERB.new(File.read(from)).result(binding)
    puts "   Content:\n" if testing
    puts "#{content}\n" if testing

    File.open("#{to}.new", 'w') do |new_file|
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
  # create_links
end

################################################################################
desc "Install the dot files into user's home directory and create symbolic links."
################################################################################
task :install do
  get_user_information
  create_files
  # create_links
end
