require 'test_helper'

class LibrariesQueryTest < ActiveSupport::TestCase
  test "should filter libraries by name" do
    query = LibrariesQuery.new(search_lib_name: "Public")
    results = query.results
    assert_equal 1, results.count
    assert_equal "Public Library", results.first.name
  end

  test "should sort libraries by name" do
    query = LibrariesQuery.new(sort_lib_name: "desc")
    results = query.results
    assert_equal 3, results.count
    assert_equal "University Library", results.first.name
  end

  test "should sort libraries by location" do
    query = LibrariesQuery.new(sort_location: "asc")
    results = query.results
    assert_equal 3, results.count
    assert_equal "City Library", results.first.name
  end

  test "should sort libraries by number of books" do
    query = LibrariesQuery.new(sort_books: "desc")
    results = query.results
    assert_equal 3, results.count
    assert_equal "Public Library", results.first.name
  end

  test "should sort libraries by number of books in a specific genre" do
    query = LibrariesQuery.new(sort_genre: "asc")
    results = query.results
    assert_equal 3, results.count
    assert_equal "University Library", results.first.name
  end
end