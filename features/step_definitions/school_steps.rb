Given /^the following schools exist:$/ do |schools_table|
  schools_table.hashes.each do |school|
    School.create(school)
  end
end
