desc "check all resources"
task :check do
  Rake::Task.tasks.select {|t| t.name.start_with? "check:"}.each do |t|
    puts t.name
    t.invoke
  end
end
