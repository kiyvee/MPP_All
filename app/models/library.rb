class Library < ApplicationRecord
  has_many :books
  has_many :user_records
  has_one_attached :image

  def self.add
    (1..10).each { |i|
      loc = i % 2 == 0 ? 'Kharkiv' : 'Odessa'
      q = "INSERT INTO libraries(name, location, created_at, updated_at) VALUES ('name #{i}', '#{loc} #{i}', NOW(), NOW())"
      ActiveRecord::Base.connection.execute(q)
    }
  end

  def self.to_csv
    attributes = %w{name location genre_count user_names}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |library|
        @users = User.joins(:user_record).where(reader_cards: {library_id: library.id})
        csv << [library.name, library.books.count, library.books.select(:genre_id).distinct.count, @users.each do |user| user.name end]
      end
    end
  end


  def book_count
    books.count
  end

  def genre_count
    books.select(:genre_id).distinct.count
  end
end
