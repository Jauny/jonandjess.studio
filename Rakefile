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

FileList['views/*.haml'].each do |src|
  target = src.gsub("views/", "").gsub("haml", "html")
  file target => src do |t|
    compile target, src
  end
  task :default => target
end

task :default do
  puts "running default"
end

#task :build do
#  Dir['./views/*.haml'].each do |filename|
#    puts filename
#    # load the layout
#    layout = Haml::Engine.new(File.read('./views/layout/layout.haml'))
#
#    # load the page
#    page = Haml::Engine.new(File.read(filename))
#
#    # render layout embedding the filename html inside
#    html = layout.render do
#      page.render
#    end
#
#    # build the html file name from the filename
#    html_filename = filename.gsub("_", "").gsub("views/", "").gsub("haml", "html")
#
#    # write the html content to the html file
#    File.open(html_filename, "w") do |f|
#      f.write(html)
#    end
#  end
#end
