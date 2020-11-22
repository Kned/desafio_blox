require 'rails_helper'

RSpec.describe Meeting, type: :model do
  describe "#create" do
    let(:user) { create :user }
    let(:classroom ) { create :classroom }
    context "with unique attributes" do
      
      it "saves" do
        no_errors = described_class.new( name: "unique_name", start_time: Time.now, user_id: user.id, classroom_id: classroom.id)

        expect(no_errors.valid?).to be true
        expect(no_errors.errors.count).to be 0
        expect(no_errors.save!).to be true
      end
    end

    context "with duplicated name" do
      it "saves" do
        described_class.create( name: "not unique_name", start_time: Time.now, user_id: user.id, classroom_id: classroom.id)
        no_errors = described_class.new( name: "not unique_name", start_time: Time.now, user_id: user.id, classroom_id: classroom.id)
        
        expect(no_errors.valid?).to be true
        expect(no_errors.errors.count).to be 0
        expect(no_errors.save!).to be true
      end
    end

    context "with duplicated start_time" do
      context "same classroom" do
        it "saves" do
          time = Time.now
          described_class.create( name: "not unique_name", start_time: time, user_id: user.id, classroom_id: classroom.id)
          with_errors = described_class.new( name: "not unique_name", start_time: time, user_id: user.id, classroom_id: classroom.id)
          
          expect(with_errors.valid?).to be false
          expect(with_errors.errors.count).to be 1
        end
      end
   
      context "with different classroom" do
        let(:classroom2) { create :classroom }

        it "saves" do
          time = Time.now

          described_class.create( name: "not unique_name", start_time: time, user_id: user.id, classroom_id: classroom.id)
          no_errors = described_class.new( name: "not unique_name", start_time: time, user_id: user.id, classroom_id: classroom2.id)
          
          expect(no_errors.valid?).to be true
          expect(no_errors.errors.count).to be 0
          expect(no_errors.save!).to be true
        end
      end
    end
  end
end
