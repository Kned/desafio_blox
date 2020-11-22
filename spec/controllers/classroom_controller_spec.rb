require "rails_helper"

RSpec.describe ClassroomsController do
  
  describe "GET index" do
    sign_in_some_user
    it "assigns @classrooms" do
      classroom = create :classroom
      get :index
      expect(assigns(:classrooms)).to eq([classroom])
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    sign_in_some_user
    
    it "assigns @classroom" do
      classroom = create :classroom
      get :show, params: { id: classroom.id }
      expect(response.status).to eq(200)
      expect(assigns(:classroom)).to eq(classroom)
    end

    it "assigns @meetings" do
      meeting  = create :meeting
      get :show, params: { id: meeting.classroom_id }
      expect(response.status).to eq(200)
      expect(assigns(:meetings)).to eq([meeting])
      expect(assigns(:meetings).size).to eq(1)
    end
  end

  describe "POST create" do
    sign_in_some_user
    it "saves classroom" do
      post :create, params: { classroom: { name: "classroom1" } }
    
      expect(response.status).to eq(200)
      expect(Classroom.count).to eq(1)
      expect(Classroom.first.name).to eq("classroom1")
    end
  end

  describe "DELETE destroy" do
    sign_in_some_user

    it "deletes classroom" do
      classroom = create :classroom
      delete :destroy, params: { id: classroom.id }
    
      expect(response.status).to eq(200)
      expect(Classroom.count).to eq(0)
    end

  end


end