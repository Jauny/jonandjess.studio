LAYOUT_FILE = "views/layout/layout.haml"
PARTIALS_DIR = "views/partials/"

def compile_template src, target
  puts "compiling #{src} into #{target}"

  layout = parse_haml LAYOUT_FILE
  page = parse_haml src

  html = layout.render do
    page.render
  end

  File.open(target, "w") do |f|
    f.write(html)
  end
end

def partial name
  file_path = PARTIALS_DIR + name.to_s + '.haml'
  partial = parse_haml file_path

  partial.render
end

def parse_haml file
  Haml::Engine.new(File.read(file))
end