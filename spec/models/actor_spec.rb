require "rails_helper"

RSpec.describe Actor, type: :model do

  # describe 'validations' do
  #   it { should validate_presence_of :name }
  #   it { should validate_presence_of :age }
  # end

  describe "relationships" do
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors)}
  end

  describe "class methods" do
    xit "" do

    end
  end
end
