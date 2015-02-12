require 'pathname'
module RuboCop
  module Select
    class File
      def self.intersect(
        # TODO: I don't want to access actual file system
        before_files = [],
          before_base_dir = Dir.pwd,
          after_files = [],
          after_base_dir = Dir.pwd
      )
        before_files.map do |file|
          Pathname.new(::File.expand_path(file, before_base_dir))
        end \
        & \
          after_files.map do |file|
            Pathname.new(::File.expand_path(file, after_base_dir))
          end
      end
    end
  end
end
