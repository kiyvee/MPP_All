class Book < ApplicationRecord
  belongs_to :library
  belongs_to :author
  has_many :genres

  def self.add
    (1..1).each { |i|

      input = Book.new(title: "title #{i+2}",
                       description: "desc #{i+2}",
                       library_id: Library.find(2).id,
                       author_id: Author.find(2).id,
                       genre_id: Genre.find(4).id,
                       created_at: Time.now,
                       updated_at: Time.now)
      input.save
    }
  end
end
