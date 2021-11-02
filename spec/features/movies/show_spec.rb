require "rails_helper"

RSpec.describe "movies show page", type: :feature do

  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @warnerbro = Studio.create!(name: 'Warner Brothers', location: 'Miami')

    @ark = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')

    visit "/movies/#{@shrek.id}"
  end

  it "" do
  end

end

#
# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
