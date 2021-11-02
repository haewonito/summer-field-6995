require "rails_helper"

RSpec.describe Actor, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe "relationships" do
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors)}
  end

  describe "class methods" do
    it "#order_by_age" do

      @harrison = Actor.create!(name: "Harrison Ford", age: 79)
      @julia = Actor.create!(name: "Julia Roberts", age: 54)
      @emma = Actor.create!(name: "Emma Thompson", age: 62)

      expect(Actor.order_by_age).to eq([@julia, @emma, @harrison])
    end
  end
end
