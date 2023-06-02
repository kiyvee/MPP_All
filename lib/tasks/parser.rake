namespace :parse do

  desc "Parses library names from Wiki page"
  task wiki: :environment do
    require 'nokogiri'
    require 'open-uri'

    doc = Nokogiri::HTML(URI.open('https://en.wikipedia.org/wiki/List_of_libraries'))
    items = doc.css('li')

    100.times do |i|
      name = items[i].at_css('a')&.text

      if name&.length.to_i > 4
        Library.create(
          name: name,
          location: i % 2 == 0 ? 'Kharkiv' : 'Odessa',
          year: 2023
        )
      end

    end

  end

  task file: :environment do
    require 'csv'
    path = Rails.root.join(File.dirname(__FILE__ ), '/home/bohdan_yun/Documents/lib_crud/lib/csv_files/libraries_6.csv')
    table = CSV.parse(File.read(path), headers: true)

    100.times do |i|
      Library.create(
        name: table[i][3],
        location: i % 2 == 0 ? 'Kharkiv' : 'Odessa',
        year: 2023,
        address: table[i][4],
        zipcode: table[i][6]
      )
    end
  end

  task multi: [:wiki, :file] do
    threads = []

    threads << Thread.new {Rake::Task['parse:wiki'].invoke}
    threads << Thread.new {Rake::Task['parse:file'].invoke}

    threads.join(&:join)
  end

end