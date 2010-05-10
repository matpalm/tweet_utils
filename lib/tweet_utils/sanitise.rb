#!/usr/bin/env ruby
require 'cgi'

class String  

  def without_urls
    gsub(/http.*?\s/,' ').sub(/http.*?$/,' ') # single regex for this? i'm sleepy
  end

  def duplicate_spaces_removed
    gsub(/\n/, ' ').gsub(/\t/, ' ').gsub(/\s+/, ' ')
  end

  def duplicate_punctuation_removed
    gsub(/!+/,'!').gsub(/\.+/,'.')
  end


=begin  
  def without_at_names
    gsub(/@.*\s/,' ')
  end
  
  def with_amps_spaced
    gsub /&/, ' & '
  end
  
  def without_punctuation
    gsub(/[\',]/,'').gsub(/[^a-z0-9&@#]/, ' ')
  end
=end

end

class Sanitiser

  def initialize *options
    @options = options
  end
    
  def sanitise string
    result = string.chomp.downcase
    result = result.without_urls if @options.include?(:without_urls)
    result = result.duplicate_punctuation_removed if @options.include?(:duplicate_punctuation_removed)
    CGI.unescapeHTML(result.duplicate_spaces_removed.strip)
  end
  
end

