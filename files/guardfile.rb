# Guardfile - The big example
# Place this file as ~/.Guardfile and run: `bundle exec guard`

# To customize, edit this list:
# Or, limit by group and run `bundle exec guard -g frontend`
watch_list = %w{ bundler pow sass cucumber}

################################################################################
# group :global do

  guard :bundler do
    # gems
    watch 'Gemfile'
    watch 'Gemfile.lock'
    # gems tests
    watch %r{^.+\.gemspec}
  end if watch_list.include? 'bundler'

  guard :pow do
    # pow and config
    watch %r{^\.pow(rc|env)$}
    watch %r{^config/.+\.rb$}
    # ruby
    watch '.rbenv-version'
    watch '.rvmrc'
    # gems
    watch 'Gemfile.lock'
  end if watch_list.include? 'pow'

# end
################################################################################
# group :frontend do

  guard 'shell' do
    watch %r{^public/stylesheets/*} {|m| `bundle exec rake css:min` }
    watch %r{^public/javascripts/*} {|m| `bundle exec rake js:min` }
  end if watch_list.include? 'shell'

  guard 'sass', :input          => 'public/sass',
                :output         => 'public/stylesheets',
                :notification   => "true",
                :cache          => "false",
                :style          => "compressed",
                :line_comments  => "true" do
  end if watch_list.include? 'sass'

  guard :livereload do
    watch %r{(app/assets/.+\.css)\.s[ac]ss} { |m| m[1] }
    watch %r{(app/assets/.+\.js)\.coffee} { |m| m[1] }
    watch %r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*}  { |m| "/assets/#{m[2]}" }
    watch %r{^app/helpers/.+\.rb}
    watch %r{(public/|app/assets).+\.(css|js|html)}
    watch %r{^public/.+\.(css|js|html)}
    watch %r{app/views/.+\.(erb|haml|slim|html)}
    watch %r{^config/locales/.+\.yml}
 end if watch_list.include? 'livereload'

  # https://github.com/guard/guard-puma
  guard 'puma' do
    watch 'Gemfile.lock'
    watch %r{^config|lib/.*}
  end if watch_list.include? 'puma'

# end
# ################################################################################
# group :backend do

  guard :redis do
  end if watch_list.include? 'redis'

  guard :resque, :environment => 'development' do
    watch %r{^app/(.+)\.rb$}
    watch %r{^lib/(.+)\.rb$}
  end if watch_list.include? 'resque'

# end
# ################################################################################
# group :test do

  guard 'cucumber', :cli => '--profile guard' do
    watch %r{^features/.+\.feature$}
    watch %r{^features/step_definitions/(.+)_steps\.rb$}  { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
    watch %r{^features/support/.+$}                       { 'features' }
  end if watch_list.include? 'cucumber'

  guard 'spork', wait: 60, cucumber: false, rspec: true, test_unit: false do
    watch %r{^config/environment.rb}
    watch %r{^config/environments/.+\.rb$}
    watch %r{^config/application.rb}
    watch %r{^config/initializers/.+\.rb$}
    watch 'Gemfile'
    watch 'Gemfile.lock'
    watch 'spec/spec_helper.rb'
  end if watch_list.include? 'spork'

  # guard 'rspec', :version => 1, :all_after_pass => false, :all_on_start => false do
  #   watch %r{^spec/.+_spec\.rb$}
  #   watch %r{^lib/(.+)\.rb$}     { |m| "spec/lib/#{m[1]}_spec.rb" }
  #   watch 'spec/spec_helper.rb')  { "spec" }
  #   watch %r{^spec/.+_spec\.rb$}
  #   watch %r{^app/(.+)\.rb$}                           { |m| "spec/#{m[1]}_spec.rb" }
  #   watch %r{^app/(.*)(\.erb|\.haml)$}                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  #   watch %r{^lib/(.+)\.rb$}                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  #   watch %r{^app/controllers/(.+)_(controller)\.rb$}  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  #   watch %r{^spec/support/(.+)\.rb$}                  { "spec" }
  #   watch 'spec/spec_helper.rb')                        { "spec" }
  #   watch 'config/routes.rb')                           { "spec/routing" }
  #   watch 'app/controllers/application_controller.rb')  { "spec/controllers" }
  #   watch %r{^app/views/(.+)/.*\.(erb|haml)$}          { |m| "spec/requests/#{m[1]}_spec.rb" }
  # end

  # guard 'rspec', :version => 1, :all_after_pass => true, :all_on_start => false do
  #   watch %r{^app/(.+)\.rb$}                           { |m| "spec/#{m[1]}_spec.rb" }
  #   watch %r{^app/(.*)(\.erb|\.haml)$}                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  #   watch %r{^app/views/(.+)/.*\.(erb|haml)$}          { |m| "spec/requests/#{m[1]}_spec.rb" }
  #   watch %r{^lib/(.+)\.rb$}                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  #   watch %r{^spec/.+_spec\.rb$}
  #   watch %r{^spec/support/(.+)\.rb$}                  { "spec" }
  #   watch %r{^app/controllers/(.+)_(controller)\.rb$}  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  #   watch 'app/controllers/application_controller.rb'  { "spec/controllers" }
  #   watch 'config/routes.rb'                           { "spec/routing" }
  #   watch 'spec/spec_helper.rb'                        { "spec" }
  # end

  # guard :rspec, :version => 2, :cli => "--color --drb -r rspec/instafail -f RSpec::Instafail", :bundler => false, :all_after_pass => false, :all_on_start => false, :keep_failed => false do
  #   watch %r{^app/(.+)\.rb}                                                   { |m| "spec/#{m[1]}_spec.rb" }
  #   watch %r{^app/controllers/(.+)_(controller)\.rb}                          { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/requests/#{m[1]}_spec.rb"] }
  #   watch %r{^lib/(.+)\.rb}                                                   { |m| "spec/lib/#{m[1]}_spec.rb" }
  #   watch %r{^spec/.+_spec\.rb}
  #   watch %r{^spec/support/(requests|controllers|mailers|models)_helpers\.rb} { |m| "spec/#{m[1]}" }
  #   watch 'app/controllers/application_controller.rb')                         { "spec/controllers" }
  #   watch 'config/routes.rb')                                                  { "spec/routing" }
  #   watch 'spec/spec_helper.rb')                                               { "spec" }
  # end

  # guard 'rspec', :version => 2 do
  #   watch %r{^app/(.*)(\.erb|\.haml)$}                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  #   watch %r{^app/(.+)\.rb$}                           { |m| "spec/#{m[1]}_spec.rb" }
  #   watch %r{^app/controllers/(.+)_(controller)\.rb$}  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  #   watch %r{^app/views/(.+)/.*\.(erb|haml)$}          { |m| "spec/requests/#{m[1]}_spec.rb" }
  #   watch %r{^lib/(.+)\.rb$}     { |m| "spec/lib/#{m[1]}_spec.rb" }
  #   watch %r{^spec/.+_spec\.rb$}
  #   watch %r{^spec/support/(.+)\.rb$}                  { "spec" }
  #   watch 'app/controllers/application_controller.rb')  { "spec/controllers" }
  #   watch 'config/routes.rb')                           { "spec/routing" }
  #   watch 'spec/spec_helper.rb')  { "spec" }
  # end

# end
