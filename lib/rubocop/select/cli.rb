require 'rubocop'

module RuboCop
  module Select
    class CLI
      attr_reader :options, :config_store

      def initialize
        @options = {}
        @config_store = ::RuboCop::ConfigStore.new
      end
      # Entry point for the application logic. Here we
      # do the command line arguments processing and inspect
      # the target files
      # @return [Fixnum] UNIX exit code
      def run(args = ARGV)
        @options, paths = ::RuboCop::Options.new.parse(args)
        puts 'done!'
        1
      rescue StandardError => e
        $stderr.puts e.message
        $stderr.puts e.backtrace
        return 1
      end
    end
  end
end
