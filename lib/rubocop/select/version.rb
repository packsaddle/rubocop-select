module RuboCop
  module Select
    VERSION = '0.1.2-beta'

    MSG = '%s (using RuboCop %s, running on %s %s %s)'

    module_function

    def version(debug = false)
      if debug
        format(MSG, VERSION, ::RuboCop::Version.version(false),
               RUBY_ENGINE, RUBY_VERSION, RUBY_PLATFORM)
      else
        VERSION
      end
    end
  end
end
