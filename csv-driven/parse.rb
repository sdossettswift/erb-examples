require 'erb'
require 'csv'
page_title = "JWO"

people = []
CSV.foreach("people.csv", headers: true) do |row|
  person = row.to_hash
  people.push person
end

ages = people.map do |person|
  person["age"].to_i
end

average_age = ages.reduce(:+) / ages.count


# read the template
template = File.read("template.html.erb")
# compile the ERB
output_html = ERB.new(template).result(binding)
# write to the file
File.open("index.html", "wb") {|file| file << output_html}
