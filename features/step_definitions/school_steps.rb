Given /^the following schools exist:$/ do |schools_table|
  movies_table.hashes.each do |school|
    School.create(school)
  end
end
