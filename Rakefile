task :default => :spec

desc 'Run specs'
task :spec do
  sh 'ruby -I lib spec/codemark_spec.rb'
end

desc 'Rerun specs'
task :respec do
  sh 'rerun -c -p "**/*.{rb,Rmd}" ./bin/codemark sem-intro.Rmd'
end

desc 'Build the gem'
task :build do
  sh 'gem build codemark.gemspec'
end

desc 'Install the local gemfile'
task :install => :build do
  sh 'gem install --local codemark'
end

desc 'Install the local gemfile'
task :uninstall do
  sh 'gem uninstall -x codemark'
end
