require "rails_helper"

RSpec.describe "movies show page", type: :feature do

  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @warnerbro = Studio.create!(name: 'Warner Brothers', location: 'Miami')

    @ark = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')

    @harrison = Actor.create!(name: "Harrison Ford", age: 79)
    @julia = Actor.create!(name: "Julia Roberts", age: 54)
    @emma = Actor.create!(name: "Emma Thompson", age: 62)

    MovieActor.create!(movie: @shrek, actor: @harrison)
    MovieActor.create!(movie: @shrek, actor: @julia)
    MovieActor.create!(movie: @ark, actor: @emma)

    visit "/movies/#{@shrek.id}"
  end

  it "shows movie's title, creation year and genre" do
    expect(page).to have_content("Shrek: Comedy - created in 2000")
  end

  it "lists all its actors from youngest to oldest" do
    expect(page).to have_content(@harrison.name)
    expect(page).to have_content(@julia.name)
    expect(page).to_not have_content(@emma.name)
  end

  it "shows average age of all of the movie's actors" do
    expect(page).to have_content("66.5")
  end
end

#
# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
