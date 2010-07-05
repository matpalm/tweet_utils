#!/usr/bin/env ruby
require 'cgi'

class String  

  def without_urls
    gsub(/http.*?\s/,' ').sub(/http.*?$/,' ') # single regex for this? i'm sleepy
  end

  def simple_chars    
    gsub(/[^a-z0-9!.()\[\]{}|,@$%&*;:"'\?]/,' ') # todo, drop to latin-iso-1?
  end

  def duplicate_spaces_removed
    gsub(/\n/, ' ').gsub(/\t/, ' ').gsub(/\s+/, ' ')
  end

  def duplicate_punctuation_removed
    str = self.clone
    '!.()[]{}|,@$%&*;:"\'\?'.chars.to_a.each do |char|
      regex = '\\' + char + '+' # weirdity ensues having this inside the actual gsub
      str.gsub!(/#{regex}/, char)
    end
    str
  end

end

class Sanitiser

  def initialize *options
    @options = options.clone
  end
    
  def sanitise string
    result = string.chomp.downcase
    @options.each do |opt|
      case opt
        when :without_urls 
          result = result.without_urls 
        when :simple_chars 
          result = result.simple_chars
        when :duplicate_punctuation_removed 
          result = result.duplicate_punctuation_removed
        when :duplicate_spaces_removed 
          result = result.duplicate_spaces_removed
        when :unescape_html 
          result = CGI.unescapeHTML(result) 
      end
    end
    result
  end
  
end

