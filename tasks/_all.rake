desc "check all resources"
task :_all do
  Rake::Task.tasks.reject {|t| ["_all", "default"].include? t.name}.each(&:invoke)
end
