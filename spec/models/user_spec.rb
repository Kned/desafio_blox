require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "#create" do
    context "with unique email" do
      it "saves" do
        no_errors = described_class.new( email: "unique_email@email.com", password: "bah4quaz" )
        
        expect(no_errors.valid?).to be true
        expect(no_errors.errors.count).to be 0
        expect(no_errors.save!).to be true
      end
    end

    context "with duplicated email" do
      it "saves" do
        described_class.create( email: "unique_email@email.com", password: "bah4quaz")
        with_errors = described_class.new( email: "unique_email@email.com", password: "bah4quaz" )
        
        expect(with_errors.valid?).to_not be true
        expect(with_errors.errors.count).to be 1
      end
    end
  end

  context "with invalid email" do
    it "saves" do
      with_errors = described_class.new( email: "invalid_email", password: "bah4quaz" )
      
      expect(with_errors.valid?).to_not be true
      expect(with_errors.errors.count).to be 1
    end
  end
end
