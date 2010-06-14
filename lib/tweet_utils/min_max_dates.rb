#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'date'

min_dts, max_dts = nil
STDIN.each do |tweet|
  tweet = JSON::parse(tweet) rescue {}
  next unless tweet.has_key? 'created_at'
  dts = DateTime.parse(tweet['created_at'])
  if min_dts.nil?
    min_dts = max_dts = dts
  elsif dts < min_dts
    min_dts = dts
  elsif dts > max_dts
    max_dts = dts
  end
end

puts "#{min_dts} | #{max_dts}"


