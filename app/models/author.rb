class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :book

  def self.add
    (1..10).each { |i|
      q = "INSERT INTO authors(name, bio, created_at, updated_at) VALUES ('name #{i.to_s}', 'bio #{i.to_s}', NOW(), NOW())"
      ActiveRecord::Base.connection.execute(q)
    }
  end
end
