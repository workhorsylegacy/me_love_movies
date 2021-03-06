#!/usr/bin/env ruby

require 'rubygems'
require 'mechanize'
require 'hpricot'
require 'active_record'

# Monkey patch Mechanize to include an Ubuntu Hardy Firefox user agent
WWW::Mechanize::AGENT_ALIASES['Ubuntu Firefox 3.0'] = 
		"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092510 Ubuntu/8.04 (hardy) Firefox/3.0.3"



# Get the arguments
$mode = ARGV.first

# Print the usage if there are no args
if ARGV.length == 0 || %w{ download }.include?($mode) == false
	puts "allposter_spider"
	puts "Usage: allposter_spider COMMAND"
	puts "\n"
	puts "List of Commands:\n"
	puts "download    Downloads the affiliate links, and saves "
	puts "            them in the db for that title."
	exit
end

def dl_poster_links
	# Connect to the website database
	connection_format = { :adapter => 'mysql',
							:encoding => 'utf8',
							:database => 'me_love_movies_development',
							:username => 'root',
							:password => 'letmein',
							:socket => '/var/run/mysqld/mysqld.sock' } # Debian/Ubuntu
							#:socket => '/var/lib/mysql/mysql.sock' }    # Fedora
	ActiveRecord::Base.establish_connection(connection_format)

	# Load all the models from the website
	%w{rating sex title title_rating title_review user user_type}.each do |file|
		require "app/models/#{file}.rb"
	end

	for title in Title.find(:all)
		begin
			# Create a browser
			agent = WWW::Mechanize.new
			agent.user_agent_alias = 'Ubuntu Firefox 3.0'

			# Go to the search page
			page = agent.get("http://www.allposters.com/gallery.asp?startat=%2Fsearchadvanced.asp")

			# Enter the title name, and select movies and posters
			form = page.forms.with.name("form1").first
			form.fields.name("Search").first.value = title.proper_name
			form.fields.name("CategoryID").options.each do |option|
				form.fields.name("CategoryID").value = option.value if option.text == "Movies"
			end
			form.fields.name("ItemType").options.each do |option|
				form.fields.name("ItemType").value = option.value if option.text == "Poster/Print"
			end
			page = agent.submit(form)

			# Get the url of the poster image
			doc = Hpricot(page.body)
			map = {}
			doc.search("//img[@class='thmbd']").each do |img|
				# Skip anything with the wrong name
				next unless img.raw_attributes['src'].downcase.include? "~#{title.proper_name.downcase.gsub(' ', '-')}-posters.jpg"

				# Skip any poster sets
				next if img.raw_attributes['src'].downcase.include? "poster_set"

				# Get the poster url and product id
				url = img.raw_attributes['src'].gsub('/pic/', '/')

				last_slash = url.rindex('/')
				last_tilde = url.rindex('~')

				before = url[0..last_slash]
				middle = url[last_slash+1..last_tilde-1].upcase
				after = url[last_tilde+1..-1]
				middle = middle[0..-3] if middle[-2, 2] == "_B"
				poster_url = "#{before}#{middle}.jpg"

				href = img.parent.raw_attributes['href']
				item_id = href[href.index('APNum=')+6 .. href.index('&CID')-1]

				map[item_id] = poster_url
			end

			# Combine the ids and urls into a string
			affiliate_links = ""
			map.each do |item_id, poster_url|
				affiliate_links += "#{item_id},#{poster_url};"
			end

			# Add all the poster links to the title
			if title.update_attributes(:affiliate_links => affiliate_links)
				puts "'#{title.proper_name}'".ljust(50) + " had #{map.length} posters."
			else
				puts "'#{title.proper_name}'".ljust(50) + " failed to update."
			end
		rescue
			puts "'#{title.proper_name}'".ljust(50) + " threw."
		end

		# Sleep for a bit as to not DOS allposters.com
		GC.start
		sleep(2)
	end
end



time_start = Time.now
puts "Started at #{time_start.to_s}"

case $mode
	when 'download':
		dl_poster_links
end

puts "Done"
time_end = Time.now
puts "Finished at #{time_end.to_s}"
puts "Total time #{(time_end - time_start).to_s}"



