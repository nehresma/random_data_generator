#!/usr/bin/env ruby

require 'optparse'
require File.join(File.dirname(__FILE__), 'lib', 'random.rb')

US_GEOGRAPHY=File.join(File.dirname(__FILE__), 'data', 'us_geography.csv')
US_SURNAMES=File.join(File.dirname(__FILE__), 'data', 'surnames.csv')
US_FIRSTNAMES=File.join(File.dirname(__FILE__), 'data', 'firstnames.csv')

options={:fields => []}
opts = OptionParser.new do |opts|
  opts.banner = "Usage: makefake.rb [options]"

  opts.on("--records n", Integer, "Number of records to generate", '=MANDATORY') { |n| options[:count] = n }

  opts.on("--fields x,y,z", Array, "Random fields to include", "Fields can be: city, zip, surname, firstname, sha1hash") do |fields|
    fields.each do |field|
      case field
        when 'city' then options[:fields].push(RandomUSCity.new US_GEOGRAPHY)
        when 'zip' then options[:fields].push(RandomUSZip.new US_GEOGRAPHY)
        when 'surname' then options[:fields].push(RandomUSSurname.new US_SURNAMES)
        when 'firstname' then options[:fields].push(RandomUSFirstname.new US_FIRSTNAMES)
        when 'sha1hash' then options[:fields].push(RandomSha1Hash.new)
        else
          puts "Invalid field #{field}"
          puts opts
          exit
      end
    end
  end

  opts.on_tail("-h", "--help", "Show this help message") do
    puts opts
    exit
  end

end
opts.parse!

unless options[:count]
  puts "Number of records is required"
  puts opts
  exit
end

if options[:fields].size == 0
  puts "No fields specified"
  puts opts
  exit
end

options[:count].times do
  puts options[:fields].map {|f| f.random}.join(',')
end
