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
        expand_files(before_files, before_base_dir) \
        & expand_files(after_files, after_base_dir)
      end

      def self.expand_files(files, base_dir)
        files.map { |f| Pathname.new(::File.expand_path(f, base_dir)) }
      end
    end
  end
end
