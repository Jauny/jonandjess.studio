require 'haml'

def compile(target, src)
  puts "compiling #{src} into #{target}"

  layout = Haml::Engine.new(File.read('./views/layout/layout.haml'))
  page = Haml::Engine.new(File.read(src))
  html = layout.render do
    page.render
  end

  File.open(target, "w") do |f|
    f.write(html)
  end
end

task :dev do
  sh "bundle exec guard"
end

FileList['views/*.haml'].each do |src|
  target = src.gsub("views/", "").gsub("haml", "html")
  file target => src do |t|
    compile target, src
  end
  task :compile => target
end

