require 'thor'

module Lobber
  class CLI < Thor
    default_task :lob

    desc "DIRECTORY", "Upload a directory to Amazon S3"
    option :bucket
    def lob(directory = nil)
      return usage unless directory

      unless File.directory? directory
        error "#{directory} is not a valid directory"
        exit 1
      end

      Lobber.upload(directory, options[:bucket])

      say "Successfully uploaded #{directory}", "\033[32m"
    end

    desc "usage", "Display usage banner", hide: true
    def usage
      say "Lobber #{Lobber::VERSION}"
      say "https://github.com/mdb/lob"
      say "\n"

      help
    end
  end
end
