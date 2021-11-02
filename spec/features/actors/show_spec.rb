# As a user,
# When I visit an actor's show page
# I see that actors name and age
# And I see a unique list of all of the actors this particular actor has worked with.


require "rails_helper"

RSpec.describe "actor's show page", type: :feature do
  describe "" do
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

      visit "/actors/#{@emma.id}"
    end

    it "show that actor's name and age" do
      expect(page).to have_content("Emma Thompson: 62 years old.")
    end
  end
end
