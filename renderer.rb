LAYOUT_FILE = "views/layout/layout.haml"
PARTIALS_DIR = "views/partials/"

def compile_template src, target
  puts "compiling #{src} into #{target}"

  page = File.basename(src, ".haml")
  layout = parse_haml LAYOUT_FILE
  content = parse_haml src

  html = layout.render Object.new, :active => page do
    content.render
  end

  File.open(target, "w") do |f|
    f.write(html)
  end
end

def partial name, **kwargs
  file_path = PARTIALS_DIR + name.to_s + '.haml'
  partial = parse_haml file_path

  partial.render Object.new, kwargs
end

def parse_haml file
  Haml::Engine.new(File.read(file))
end