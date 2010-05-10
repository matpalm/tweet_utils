require 'rubygems'
require 'json'

def for_each_tweets_from_stdin
  STDIN.each do |line|
    begin
      tweet = JSON::parse(line.chomp)
      next unless tweet.has_key? 'text'
      yield tweet
    rescue Exception => e
      STDERR.puts "FAIL [#{e.message}] [#{line}]"
    end
  end
end
