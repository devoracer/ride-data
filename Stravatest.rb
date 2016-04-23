require 'pp'
require 'strava/api/v3'
#replace with your token, found at https://www.strava.com/settings/api
TOKEN = ENV['STRAVA_TOKEN']
client = Strava::Api::V3::Client.new(:access_token => TOKEN)
# activities = client.list_athlete_activities(per_page: 30, page: 1)

current_page = 1

loop do
	# actions to take on the current page
	activities = client.list_athlete_activities(page: current_page)
	
	activities.each do |activity|
	  	name = activity["name"]
	  	max_speedms = activity["max_speed"]
	  	max_speedmph = (max_speedms * 2.23694).round(2)
	  	puts name
	end

	if  activities.length < 30
		break
	end

	current_page += 1
end 

# Loop through pages, printing off each page. until there's less than
# 30 activites per page

# max_speedms = activities[3]["max_speed"]

# max_speedmph = (max_speedms * 2.23694).round(2)
# puts "Your max speed was #{max_speedmph}mph!"

# elev_gain = activities[3]["total_elevation_gain"]
# elev_gainft = (elev_gain * 3.28084).round(2)
# puts "You gained #{elev_gainft}ft of elevation"

# max_speedmsall = activities["max_speed"]

# max_speedmphall = (max_speedmsall * 2.2694).round(2)
# puts "your max speeds were #{max_speedmphall}mph"

# # pp activities
# puts activities.length
# activities.each do |activity|
#   name = activity["name"]
#   max_speedms = activity["max_speed"]
#   max_speedmph = (max_speedms * 2.23694).round(2)
#   puts "On #{name} your max speed was #{max_speedmph}."
# end
