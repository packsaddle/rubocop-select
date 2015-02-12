
full_scan_files = []
selector = Rubocop::Select.new(full_scan_files)
diff_files = []
selector.intersect(diff_files) #=> target_files
