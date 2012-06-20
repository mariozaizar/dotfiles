# http://iain.nl/2010/07/customizing-irb-2010-edition/
# http://snippets.rorbuilder.info/posts/show/272
# http://robots.thoughtbot.com/post/159806033/irb-script-console-tips
# http://tagaholic.me/2009/05/29/exploring-how-to-configure-irb.html

require 'rubygems'

IRB.conf[:HISTORY_FILE] = "~/.irb_history"
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200 # Try with: __
IRB.conf[:PROMPT_MODE] = :INF_RUBY # DEFAULT, SIMPLE, XMP, INF_RUBY
IRB.conf[:AUTO_INDENT] = true
