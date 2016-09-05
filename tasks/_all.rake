desc "check all resources"
task :_all do
  Rake::Task.tasks.reject {|t| ["_all", "default"].include? t.name}.each do |t|
    puts t.name
    t.invoke
  end
end
