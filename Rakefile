require 'rake'
require 'erb'

################################################################################
# CHANGE THIS!
USER_NAME     = 'Mario Zaizar' 
USER_EMAIL    = 'mariozaizar@gmail.com'
GITHUB_USER   = 'mariozaizar'
GITHUB_TOKEN  = 'yourtoken123456789012345678901234567890'
PROJECTS_DIR  = '~/Documents/Repositorios/'

################################################################################
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

################################################################################
desc "Just test and print the results, Don't do anything yet."
task :test do
  create_links
  create_files
end

desc "Install the dot files into user's home directory and create symbolic links."
task :install do
  create_links
  create_files
end

################################################################################
def create_links testing=true
  puts "\nCreate #{LINKS.count} symbolic links:"

  LINKS.each do |from, to|
    puts " - Linking #{from} to #{to}"

    if File.exist?(from) && !File.exist?(to)
      system %Q{ln -s "#{from}" "#{to}"} unless testing
    else
      puts "   Warning: destination already exists!" if File.exist?(to)
      puts "   Warning: origin file doesn't exist!" unless File.exist?(from)
    end
  end
end

def create_files testing=true
  puts "\nReplace #{FILES.count} files:"

  FILES.each do |from, to|
    puts " - #{from} to #{to}"
    to.gsub!('~', HOME_DIR)
    
    if File.exist?(to)
      puts "   Warning: #{to} exists!"
      # system %Q{cp "#{to}" "#{to}.old"} unless testing
    end

    content = ERB.new(File.read(from)).result(binding)
    puts "   Content:"
    puts "---------------------------------------------------------------------"
    puts "#{content}"
    puts "---------------------------------------------------------------------"
    
    # File.open(to, 'w') do |new_file|  
    #   new_file.write content
    # end unless testing
  end
end
