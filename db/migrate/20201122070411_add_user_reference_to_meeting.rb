class AddUserReferenceToMeeting < ActiveRecord::Migration[5.0]
  def change
    add_reference :meetings, :user, index: true
  end
end
