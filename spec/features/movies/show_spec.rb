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

  it "does not show any actors that are not part of the movie" do
    expect(page).to_not have_content(@emma.name)
  end

  it "has a form to add an actor to this movie" do

    expect(page).to have_content("Fill in the name of the actor you want to add to the movie and click 'Submit'")
    fill_in :actor_name, with: @emma.name
    click_on "Submit"

    expect(current_path).to eq("/movies/#{@shrek.id}")
    expect(page).to have_content(@emma.name)
  end
end


# Add an Actor to a Movie

# And I see a form to add an actor to this movie
# When I fill in the form with the name of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
