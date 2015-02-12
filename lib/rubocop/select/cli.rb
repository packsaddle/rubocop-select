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
        act_on_options

        target_finder = ::RuboCop::TargetFinder.new(@config_store)
        full_scan_files = target_finder.find('')
        @output.puts File.intersect(full_scan_files, Dir.pwd, paths, Dir.pwd)
        0
      rescue StandardError => e
        $stderr.puts e.message
        $stderr.puts e.backtrace
        return 1
      end

      private

      def act_on_options
        handle_exiting_options

        ConfigLoader.debug = @options[:debug]
        ConfigLoader.auto_gen_config = @options[:auto_gen_config]

        @config_store.options_config = @options[:config] if @options[:config]
      end

      def handle_exiting_options
        return unless ::RuboCop::Options::EXITING_OPTIONS.any? { |o| @options.key? o }

        puts RuboCop::Select.version(false) if @options[:version]
        puts RuboCop::Select.version(true) if @options[:verbose_version]
        exit(0)
      end
    end
  end
end
