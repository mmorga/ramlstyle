require "bundler/gem_tasks"
require "rake/testtask"
require "rubocop/rake_task"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/test_*.rb']
end

RuboCop::RakeTask.new do |task|
  task.patterns = ['exe/*', 'lib/**/*.rb', 'test/**/*.rb']
end

desc "Run rubycritic on source and display results"
task :rubycritic do
  sh "bin/rubycritic;open tmp/rubycritic/overview.html"
end

desc "Run sandi_meter on source and display results"
task :sandi do
  sh "sandi_meter -o tmp/sandi_meter -g"
end

desc "Run rubocop, rubycritic, and sandi_meter on source and display results"
task quality: [:rubycritic, :sandi, :rubocop]

task default: :test
