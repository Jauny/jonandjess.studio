# A Guardfile
# More info at https://github.com/guard/guard#readme

# Only watch the /views directory
#directories %w(views, static) \
# .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

# Run rake compile when a views/*.haml file is changed
guard 'rake', :task => 'compile' do
  watch(%r{^views/.+\.haml$})
  watch(%r{^static/.+$})
end
