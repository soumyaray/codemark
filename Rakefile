task :default => :spec

desc 'Run specs'
task :spec do
  sh 'ruby -I lib spec/citesight_spec.rb'
end

desc 'Rerun specs'
task :respec do
  sh 'rerun -c -p "**/*.{rb,Rmd}" ruby bin_codemark.rb sem-intro.Rmd'
end
