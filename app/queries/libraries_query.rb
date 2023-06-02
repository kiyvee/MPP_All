class LibrariesQuery
  attr_accessor :search_lib_name,
                :sort_lib_name,
                :sort_location,
                :sort_books,
                :sort_genre

  def initialize(search_lib_name = nil, sort_lib_name = nil, sort_location = nil, sort_books = nil, sort_genre)
    @search_lib_name = search_lib_name
    @sort_lib_name = sort_lib_name
    @sort_location = sort_location
    @sort_books = sort_books
    @sort_genre = sort_genre
  end

  def results
    libraries = Library.all

    libraries = libraries.where("name LIKE ?", "%#{search_lib_name}%") if search_lib_name.present?

    if sort_lib_name.present?
      direction = %w[asc desc].include?(sort_lib_name) ? sort_lib_name : 'asc'
      libraries = libraries.order(Arel.sql("name #{direction}"))
    else
      libraries = libraries.order(created_at: :asc)
    end

    if sort_location.present?
      direction = %w[asc desc].include?(sort_location) ? sort_location : 'asc'
      libraries = libraries.order(Arel.sql("location #{direction}"))
    else
      libraries = libraries.order(created_at: :asc)
    end

    if sort_books.present?
      direction = %w[asc desc].include?(sort_books) ? sort_books : 'asc'
      libraries = libraries.select('libraries.*, COUNT(books.id) AS books_count')
                           .left_joins(:books)
                           .group('libraries.id')
                           .order(Arel.sql("books_count #{direction}"))
    else
      libraries = libraries.order(created_at: :asc)
    end

    if sort_genre.present?
      direction = %w[asc desc].include?(sort_genre) ? sort_genre : 'asc'
      libraries = libraries.select('libraries.*, COUNT(books.genre_id) AS genre_count')
                           .left_joins(:books)
                           .group('libraries.id')
                           .order(Arel.sql("genre_count #{direction}"))
    else
      libraries = libraries.order(created_at: :asc)
    end

    libraries
  end

end
