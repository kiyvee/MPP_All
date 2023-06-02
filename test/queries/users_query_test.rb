require 'test_helper'

class UsersQueryTest < ActiveSupport::TestCase
  test "returns all users when no parameters are given" do
    query = UsersQuery.new
    results = query.results
    assert_equal User.count, results.count
  end

  test "filters users by full name" do
    query = UsersQuery.new(search_full_name: "John Doe")
    results = query.results
    assert_equal 1, results.count
    assert_equal "John", results.first.name
    assert_equal "Doe", results.first.surname
  end

  test "filters users by age" do
    query = UsersQuery.new(age: 30)
    results = query.results
    assert_equal 2, results.count
    assert_equal [30, 30], results.map(&:age).sort
  end

  test "sorts users by name in ascending order" do
    query = UsersQuery.new(sort_name: "asc")
    results = query.results
    assert_equal ["John Doe", "John Smith", "Mary Johnson"], results.map { |u| "#{u.name} #{u.surname}" }
  end

  test "sorts users by name in descending order" do
    query = UsersQuery.new(sort_name: "desc")
    results = query.results
    assert_equal ["Mary Johnson", "John Smith", "John Doe"], results.map { |u| "#{u.name} #{u.surname}" }
  end

  test "sorts users by age in ascending order" do
    query = UsersQuery.new(sort_age: "asc")
    results = query.results
    assert_equal [25, 30, 30], results.map(&:age)
  end

  test "sorts users by age in descending order" do
    query = UsersQuery.new(sort_age: "desc")
    results = query.results
    assert_equal [30, 30, 25], results.map(&:age)
  end
end
