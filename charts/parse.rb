require 'erb'
require 'csv'

puts "Oh Hai. What is your name"
name = gets.chomp # always do this

puts "How many hours a day do you work?"
work_hours = gets.chomp.to_f

puts "How many hours a day do you eat?"
eat_hours = gets.chomp.to_f

puts "How many hours a day is your commute?"
commute_hours = gets.chomp.to_f

puts "How many hours a day do you watch TV (and/or netflix)?"
tv_hours = gets.chomp.to_f

puts "How many hours a day do you sleep?"
sleep_hours = gets.chomp.to_f

total_allocated = [work_hours, eat_hours, commute_hours, tv_hours, sleep_hours].reduce(:+)
unallocated = 24 - total_allocated

# do all the erb things
erb = File.read("template.html.erb")
html= ERB.new(erb).result(binding)
File.open("index.html", "wb") {|file| file << html}
