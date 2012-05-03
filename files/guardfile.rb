# Guardfile - The big example
# Place this file as ~/.Guardfile and run: `bundle exec guard`

# To customize, edit this list:
# Or, limit by group and run `bundle exec guard -g frontend`
watch_list = %w{ bundler pow sass shell rspec1 }

# Guard help: https://github.com/guard/guard
# Plugins help: https://github.com/guard/guard-[plugin-name]
# Example: https://github.com/guard/guard-sass

################################################################################
# group :global do

  guard :bundler do
    watch 'Gemfile'
    watch 'Gemfile.lock'
    watch %r{^.+\.gemspec}
  end if watch_list.include? 'bundler'

  guard :pow do
    watch '.powrc'
    watch '.powenv'
    watch '.rbenv-version'
    watch '.rvmrc'
    watch 'Gemfile.lock'
    watch %r{^config/.+\.rb$}
  end if watch_list.include? 'pow'

# end
################################################################################
# group :frontend do

  guard :shell do
    # Minimize the css/js after restart pow
    watch 'tmp/restart.txt' do |m| `bundle exec rake css:min` end
    watch 'tmp/restart.txt' do |m| `bundle exec rake js:min` end
  end if watch_list.include? 'minimize'

  guard :sass,  :input          => 'public/sass',
                :output         => 'public/stylesheets',
                :notification   => "true",
                :cache          => "true",
                :style          => "compressed",
                :line_comments  => "true" do
  end if watch_list.include? 'sass'

  guard 'puma' do
    watch 'Gemfile.lock'
    watch %r{^config|lib/.*}
  end if watch_list.include? 'puma'

# TODO(mariozaizar) test this
 #  guard :livereload do
 #    watch %r{(app/assets/.+\.css)\.s[ac]ss} { |m| m[1] }
 #    watch %r{(app/assets/.+\.js)\.coffee} { |m| m[1] }
 #    watch %r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*}  { |m| "/assets/#{m[2]}" }
 #    watch %r{^app/helpers/.+\.rb}
 #    watch %r{(public/|app/assets).+\.(css|js|html)}
 #    watch %r{^public/.+\.(css|js|html)}
 #    watch %r{app/views/.+\.(erb|haml|slim|html)}
 #    watch %r{^config/locales/.+\.yml}
 # end if watch_list.include? 'livereload'

# end
# ################################################################################
# group :backend do

  guard :redis if watch_list.include? 'redis'

  guard :resque, :environment => 'development' do
    watch %r{^app/(.+)\.rb$}
    watch %r{^lib/(.+)\.rb$}
  end if watch_list.include? 'resque'

# end
# ################################################################################
# group :test do

# TODO(mariozaizar) this is running all the tests
  # guard 'cucumber' do
  #   watch %r{^features/.+\.feature$}
  #   watch %r{^features/step_definitions/(.+)_steps\.rb$}  do |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' end
  #   watch %r{^features/support/.+$}                       do 'features' end
  # end if watch_list.include? 'cucumber'

# TODO(mariozaizar) test this
  # guard 'spork', wait: 60, cucumber: false, rspec: true, test_unit: false do
  #   watch %r{^config/environment.rb}
  #   watch %r{^config/environments/.+\.rb$}
  #   watch %r{^config/application.rb}
  #   watch %r{^config/initializers/.+\.rb$}
  #   watch 'Gemfile'
  #   watch 'Gemfile.lock'
  #   watch 'spec/spec_helper.rb'
  # end if watch_list.include? 'spork'

# TODO(mariozaizar) remove duplicates
  guard 'rspec', :version => 1, :all_after_pass => true, :all_on_start => false do
    watch %r{^spec/.+_spec\.rb$}
    watch %r{^app/(.+)\.rb$}                           do |m| "spec/#{m[1]}_spec.rb" end
    watch %r{^lib/(.+)\.rb$}                           do |m| "spec/lib/#{m[1]}_spec.rb" end
    watch %r{^spec/support/(.+)\.rb$}                  do "spec" end
    watch 'app/controllers/application_controller.rb'  do "spec/controllers" end
    watch 'config/routes.rb'                           do "spec/routing" end
  end if watch_list.include? 'rspec1'

  # guard :rspec, :version => 2, :all_after_pass => true, :all_on_start => true do
  #   watch %r{^app/(.*)(\.erb|\.haml)$}                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  #   watch %r{^app/(.+)\.rb$}                           { |m| "spec/#{m[1]}_spec.rb" }
  #   watch %r{^app/(.+)\.rb}                                                   { |m| "spec/#{m[1]}_spec.rb" }
  #   watch %r{^app/controllers/(.+)_(controller)\.rb$}  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  #   watch %r{^app/controllers/(.+)_(controller)\.rb}                          { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/requests/#{m[1]}_spec.rb"] }
  #   watch %r{^app/views/(.+)/.*\.(erb|haml)$}          { |m| "spec/requests/#{m[1]}_spec.rb" }
  #   watch %r{^lib/(.+)\.rb$}     { |m| "spec/lib/#{m[1]}_spec.rb" }
  #   watch %r{^lib/(.+)\.rb}                                                   { |m| "spec/lib/#{m[1]}_spec.rb" }
  #   watch %r{^spec/.+_spec\.rb$}
  #   watch %r{^spec/.+_spec\.rb}
  #   watch %r{^spec/support/(.+)\.rb$}                  { "spec" }
  #   watch %r{^spec/support/(requests|controllers|mailers|models)_helpers\.rb} { |m| "spec/#{m[1]}" }
  #   watch 'app/controllers/application_controller.rb')                         { "spec/controllers" }
  #   watch 'app/controllers/application_controller.rb')  { "spec/controllers" }
  #   watch 'config/routes.rb')                                                  { "spec/routing" }
  #   watch 'config/routes.rb')                           { "spec/routing" }
  #   watch 'spec/spec_helper.rb')                                               { "spec" }
  #   watch 'spec/spec_helper.rb')  { "spec" }
  # end if watch_list.include? 'rspec2'

# end
