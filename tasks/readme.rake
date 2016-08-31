desc "Display `README.md`"
task :readme do
  puts File.read("README.md")
end
