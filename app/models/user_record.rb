class UserRecord < ApplicationRecord
  belongs_to :library
  belongs_to :user

  def self.add
    (1..10).each { |i|
      input = UserRecord.new(
        library_id: Library.find(i).id,
        user_id: User.find(i).id,
        created_at: Time.now,
        updated_at: Time.now
      )
      input.save
    }
  end

end
