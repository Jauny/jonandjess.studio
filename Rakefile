require "fileutils"
require "haml"

LAYOUT_FILE = "views/layout/layout.haml"
SRC_DIR = "views/"
SRC_FILES = "views/*.haml"
DIST_DIR = "dist/"
STATIC_DIR = "static/"

task :default => :compile
task :compile => [:cleanup, :static]

task :dev => :compile do
  sh "open dist/index.html"
  sh "bundle exec guard"
end

task :deploy => :compile do
  sh "scp -r dist/* root@174.138.4.110:/var/www/jjstatic/html/"
end

task :cleanup do
  puts "cleanup"
  FileUtils.rm_rf(DIST_DIR)
  FileUtils.mkdir_p(DIST_DIR)
end

task :static do
  puts "static"
  FileUtils.cp_r(STATIC_DIR, DIST_DIR)
  task :compile => :static
end

FileList[SRC_FILES].each do |src|
  target = src.gsub(SRC_DIR, DIST_DIR).gsub("haml", "html")
  file target => src do |t|
    render target, src
  end
  task :compile => target
end

def render(target, src)
  puts "compiling #{src} into #{target}"

  layout = Haml::Engine.new(File.read(LAYOUT_FILE))
  page = Haml::Engine.new(File.read(src))
  html = layout.render do
    page.render
  end

  File.open(target, "w") do |f|
    f.write(html)
  end
end
