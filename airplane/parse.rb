require 'csv'
require 'erb'

# answers = []

not_answered = 0 #nil
shared = 0 #"The arm rests should be shared"
dibs = 0 #"Whoever puts their arm on the arm rest first"
middle = 0 #The person in the middle seat gets both arm rests"
other = 0 #"Other (please specify)"
suckit_middle_seat = 0 #"The people in the aisle and window seats get both arm rests"

CSV.foreach("data.csv", headers: true) do |row|

  hash = row.to_hash
  who_gets_to_use = hash["In a row of three seats, who should get to use the two arm rests?"]

  case who_gets_to_use
  when "The arm rests should be shared"
    shared += 1
  when "Whoever puts their arm on the arm rest first"
    dibs += 1
  when "The person in the middle seat gets both arm rests"
    middle += 1
  when "Other (please specify)"
    other += 1
  when "The people in the aisle and window seats get both arm rests"
    suckit_middle_seat += 1
  else
    not_answered += 1
  end
  # answers.push who_gets_to_use.inspect
end

# puts answers.uniq

# do all the erb things
html_template_as_a_string = File.read("template.html.erb")
html= ERB.new(html_template_as_a_string).result(binding)
File.open("index.html", "wb") {|file| file << html}
