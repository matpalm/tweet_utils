#!/usr/bin/env ruby
require 'rubygems'
require 'json'

STDIN.each do |search_result|
  search_result = JSON::parse(search_result) rescue {}
  next unless search_result.has_key? 'results'
  search_result['results'].each { |result| puts result.to_json }
end

