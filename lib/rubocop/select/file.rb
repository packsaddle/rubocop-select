require 'pathname'
module RuboCop
  module Select
    class File
      def self.intersect(
        before_files = [],
          before_base_dir = Dir.pwd,
          after_files = [],
          after_base_dir = Dir.pwd
      )
        before_files.map do |file|
          Pathname.new(file).relative_path_from(before_base_dir)
        end \
        & \
        after_files.map do |file|
          Pathname.new(file).relative_path_from(after_base_dir)
        end
      end
    end
  end
end
