require "open-uri"
require "json"

puts "Cleaning DB"
Movie.destroy_all
Bookmark.destroy_all

puts "Creating 4 movies"
url = "https://tmdb.lewagon.com/movie/top_rated"
# comment récupérer les élément pour créer des movies à partir de cet url?
10.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)["results"]
  puts "i = #{i}"
  movies.each do |movie|
    puts "Creating #{movie["title"]}"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    puts movie
    Movie.create(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "#{base_poster_url}#{movie["backdrop_path"]}",
      rating: movie["vote_average"]
    )
  end
end

puts "Finished"