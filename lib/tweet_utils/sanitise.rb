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
    str = self.clone
    '!.()[]{}|,@$%&*;:"\''.chars.to_a.each do |char|
      regex = '\\' + char + '+' # weirdity ensues having this inside the actual gsub
      str.gsub!(/#{regex}/, char)
    end
    str
  end

end

class Sanitiser

  def initialize *options
    @without_urls = options.include?(:without_urls)
    @duplicate_punctuation_removed = options.include?(:duplicate_punctuation_removed)
  end
    
  def sanitise string
    result = string.chomp.downcase
    result = result.without_urls if @without_urls
    result = result.duplicate_punctuation_removed if @duplicate_punctuation_removed
    CGI.unescapeHTML(result.duplicate_spaces_removed.strip)
  end
  
end

