class UsersQuery
  attr_accessor :search_full_name, :age, :sort_name, :sort_age

  def initialize(search_full_name = nil, age = nil, sort_name = nil, sort_age = nil)
    @search_full_name = search_full_name
    @age = age
    @sort_name = sort_name
    @sort_age = sort_age
  end

  def results
    users = User.all

    users = users.where("concat(name, ' ', surname) LIKE ?", "%#{search_full_name}%") if search_full_name.present?
    users = users.where(age: age) if age.present?

    if sort_name.present?
      direction = %w[asc desc].include?(sort_name) ? sort_name : 'asc'
      users = users.order(Arel.sql("concat(name, ' ', surname) #{direction}"))
    else
      users = users.order(created_at: :asc)
    end

    if sort_age.present?
      direction = %w[asc desc].include?(sort_age) ? sort_age : 'asc'
      users = users.order(Arel.sql("concat(name, ' ', surname) #{direction}"))
    else
      users = users.order(created_at: :asc)
    end


    users
  end

end
