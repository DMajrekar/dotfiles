#!/usr/bin/ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

stevenage = 2636940

base_url = "http://www.bbc.co.uk/weather/"

page = Nokogiri::HTML(open("#{base_url}#{stevenage}"))
temps = page.search('#hourly table tbody tr.temperature span.units-value[data-unit=c]').map(&:text)
weather = page.search('#hourly table tbody tr.weather-type span.content img').map { |i| i.attr('alt') }

puts (0..3).to_a.map { |i| "#{temps[i]} (#{weather[i]})"  }.join (' | ')

