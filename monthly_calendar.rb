#!/usr/bin/env ruby

require 'date'

def monthly_calendar(year = Date.today.year, mon = Date.today.month)
  firstday = Date.new(year, mon, 1).wday
  lastday = Date.new(year, mon, -1).day
  top = "#{mon}月 #{year}"

  puts top.center(20)
  puts "日 月 火 水 木 金 土"
  print "   " * firstday

  (1..lastday).each do |date|
    print date.to_s.rjust(2) + " "
    firstday = firstday + 1
    if firstday % 7 == 0
      print "\n"
    end
  end
  print "\n"
end

require 'optparse'
opt = OptionParser.new

params = {}

year = Date.today.year
mon = Date.today.month

opt.on('-m mon')
opt.on('-y year')

opt.parse!(ARGV, into: params)

year = params.fetch(:y, Date.today.year).to_i
mon = params.fetch(:m, Date.today.month).to_i

puts monthly_calendar(year, mon)

