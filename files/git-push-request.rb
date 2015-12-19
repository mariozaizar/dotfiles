#!/usr/bin/env ruby
def sh(command)
  result = `#{command}`
  raise "'#{command}' failed!" unless $?.success?
  result
end

remotes = sh("git remote -v").split("\n")
remote  = remotes.detect{|l| l.start_with?("origin\t") }
url     = remote.split(" ")[1]
repo    = url.split("://").last.split(%r{[/:]}, 2).last.sub(".git", "")
branch  = sh("git rev-parse --abbrev-ref HEAD").strip

# push branch if it is not yet on origin
unless system("git show origin/#{branch} 2>&1 > /dev/null")
  puts "pushing #{branch} to origin"
  sh("git push -u origin #{branch}")
end

exec %Q{open "https://github.com/#{repo}/compare/#{branch}?expand=1"}
