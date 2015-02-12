require 'rubocop/select'
require 'rubocop'

# use same option as rubocop
config_store = RuboCop::ConfigStore.new
target_finder = RuboCop::TargetFinder.new(config_store)
full_scan_files = target_finder.find(paths)

selector = RuboCop::Select.new(full_scan_files)
diff_files = [
  '.rubocop.yml',
  'app/jobs/repo_synchronization_job.rb'
]
# full_scan_files
# .map {|f| Pathname.new File.expand_path(f)} &\
# diff_files
# .map{|f| Pathname.new File.expand_path(f)}
selector.intersect(diff_files) #=> target_files
