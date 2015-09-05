require 'nokogiri'
require 'open-uri'

usernames = {
  "FilmKnurd" => "Andrew",
  "brianknight10" => "Brian",
  "annekagoss" => "Anneka",
  "bethannezink" => "Bethanne",
  "DanFerrer" => "Dan",
  "antropova" => "Masha",
  "himedlooff" => "Mike",
  "sharnie" => "Sharnie",
  "CarpeDN" => "Dien"
}

usernames.each do |username, real_name|
  begin
    doc = Nokogiri::HTML(open("https://www.github.com/#{username}"))
    color = doc.css("#contributions-calendar [data-date=\"#{Date.today.prev_day}\"]").attr("fill")
    committed = color.to_s == "#eeeeee" ? "No commits" : "Committed"
    puts "#{username} (#{real_name}): #{committed}"
    `open https://github.com/#{username}` if committed === "No commits"
  rescue
    puts "Invalid username: #{username}"
  end
end