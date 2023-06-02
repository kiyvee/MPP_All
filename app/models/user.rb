class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_record
  has_one_attached :image

  def self.add
    (1..10).each { |i|
      q = "INSERT INTO users(name, surname, age, email, created_at, updated_at) VALUES ('name #{i}', 'surname #{i}', '#{i}', 'user#{i}@gmail.com', NOW(), NOW())"
      ActiveRecord::Base.connection.execute(q)
    }
  end

end
