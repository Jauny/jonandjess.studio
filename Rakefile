require 'haml'

task :default => [:compile]

task :compile do
  Dir['./views/*.haml'].each do |filename|
    puts filename
    # load the layout
    layout = Haml::Engine.new(File.read('./views/layout/layout.haml'))

    # load the page
    page = Haml::Engine.new(File.read(filename))

    # render layout embedding the filename html inside
    html = layout.render do
      page.render
    end

    # build the html file name from the filename
    html_filename = filename.gsub("_", "").gsub("views/", "").gsub("haml", "html")

    # write the html content to the html file
    File.open(html_filename, "w") do |f|
      f.write(html)
    end
  end
end
