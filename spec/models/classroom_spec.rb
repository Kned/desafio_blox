require 'rails_helper'

RSpec.describe Classroom, type: :model do
  
  describe "#create" do
    context "with unique name" do
      it "saves" do
        no_errors = described_class.new( name: "unique_name")

        expect(no_errors.valid?).to be true
        expect(no_errors.errors.count).to be 0
        expect(no_errors.save!).to be true
      end
    end

    context "with duplicated name" do
      it "saves" do
        described_class.create( name: "not unique_name")
        no_errors = described_class.new( name: "not unique_name")

        expect(no_errors.valid?).to_not be true
        expect(no_errors.errors.count).to be 1
      end
    end
  end
end
