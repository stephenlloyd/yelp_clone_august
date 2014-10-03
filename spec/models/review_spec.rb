require 'rails_helper'

describe Review, :type => :model do 
	it "is not valid with a rating less than 1" do
		review = Review.new(rating: -1)		
		expect(review).to have(1).error_on(:rating)
		expect(review).not_to be_valid
	end

	it "is not valid rating more than 5" do
		review = Review.new(rating: 6)		
		expect(review).to have(1).error_on(:rating)
		expect(review).not_to be_valid
	end

	it "is valid with rating between 1..5" do
		review = Review.new(rating: 4)		
		expect(review).to be_valid
	end
end
