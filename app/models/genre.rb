class Genre < ApplicationRecord
  belongs_to :book

  def self.add
    (1..10).each { |i|
      q = "INSERT INTO genres(name, created_at, updated_at) VALUES ('name #{i}', NOW(), NOW())"
      ActiveRecord::Base.connection.execute(q)
      # input = Genre.new(
      #   name: "name #{i}",
      #   created_at: Time.now,
      #   updated_at: Time.now
      # )
      #
      # input.save
    }
  end

end
