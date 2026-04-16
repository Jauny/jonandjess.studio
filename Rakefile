require "fileutils"

SRC_DIR = "views/"
SRC_FILES = "views/*.haml"
DIST_DIR = "dist/"
STATIC_DIR = "static/"

task :default => :compile

# Cloudflare Pages build task — installs gems then compiles
task :pages do
  sh "bundle install"
  Rake::Task[:compile].invoke
end

task :load_gems do
  require "bundler/setup"
  require "haml"
  require_relative "renderer"
end

task :compile => [:load_gems, :cleanup, :static]

task :dev => :compile do
  sh "open dist/index.html"
  sh "bundle exec guard"
end

task :deploy => :compile do
  sh "scp -r dist/* root@174.138.4.110:/var/www/jonandjess/v2/"
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
    compile_template src, target
  end
  task :compile => target
end
