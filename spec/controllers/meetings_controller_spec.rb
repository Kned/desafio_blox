require "rails_helper"

RSpec.describe MeetingsController do
  let(:classroom) { create :classroom }

  describe "GET show" do
    sign_in_some_user
    
    it "assigns @meeting" do
      meeting = create :meeting
      get :show, params: { classroom_id: classroom.id, id: meeting.id }
      expect(response.status).to eq(200)
      expect(assigns(:meeting)).to eq(meeting)
    end
  end

  describe "POST create" do
    sign_in_some_user
    it "saves meeting" do
      classroom = create :classroom
      post :create, params: { classroom_id: classroom.id, meeting: { name: "meeting", classroom_id: classroom.id, user_id: User.first.id, start_time: Time.now}, date: Date.today }
    
      expect(response.status).to eq(302)
      expect(Meeting.count).to eq(1)
      expect(Meeting.first.name).to eq("meeting")
    end
  end

  describe "DELETE destroy" do
    sign_in_some_user

    it "deletes classroom" do
      meeting = create :meeting
      delete :destroy, params: { classroom_id: meeting.classroom_id, id: meeting.id }
    
      expect(response.status).to eq(302)
      expect(Meeting.count).to eq(0)
    end

  end


end