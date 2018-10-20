require 'haml'

Dir['./views/*.haml'].each do |filename|
  puts filename
  engine = Haml::Engine.new(File.read('./views/layout/layout.haml'))
  html = engine.render(Object.new, :filename => filename)

  html_filename = filename.gsub("views/", "").gsub("_", "").gsub("haml", "html")
  File.open(html_filename, "w") do |f|
    f.write(html)
  end
end
