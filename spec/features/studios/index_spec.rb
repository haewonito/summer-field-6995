

require "rails_helper"

RSpec.describe "index", type: :feature do

  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @warnerbro = Studio.create!(name: 'Warner Brothers', location: 'Miami')

    @ark = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')


    visit "/studios"
  end

  it "story 1 - shows each studio's name and location" do
    expect(page).to have_content("Universal Studios: Located in Hollywood")
    expect(page).to have_content("Warner Brothers: Located in Miami")
  end

  it "story 1 - shows titles of movies underneath each studio" do
    expect(page).to have_content("Raiders of the Lost Ark")
    expect(page).to have_content("Shrek")
  end
end
