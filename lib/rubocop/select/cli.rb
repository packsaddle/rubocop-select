require 'rubocop'

module RuboCop
  module Select
    class CLI
      attr_reader :options, :config_store, :output

      def initialize
        @options = {}
        @config_store = ::RuboCop::ConfigStore.new
        @output = $stdout
      end
      # Entry point for the application logic. Here we
      # do the command line arguments processing and inspect
      # the target files
      # @return [Fixnum] UNIX exit code
      def run(args = ARGV)
        @options, paths = ::RuboCop::Options.new.parse(args)
        target_finder = ::RuboCop::TargetFinder.new(@config_store)
        full_scan_files = target_finder.find('')
        @output.puts File.intersect(full_scan_files, Dir.pwd, paths, Dir.pwd)
        0
      rescue StandardError => e
        $stderr.puts e.message
        $stderr.puts e.backtrace
        return 1
      end
    end
  end
end
