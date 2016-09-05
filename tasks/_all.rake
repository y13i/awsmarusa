desc "check all resources"
task :all do
  Rake::Task.tasks.reject {|t| ["all", "default"].include? t.name}.each do |t|
    puts t.name
    t.invoke
  end
end
