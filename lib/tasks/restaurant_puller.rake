require "./lib/open_table_puller"

namespace :restaurant do 
  desc "Refresh the locally stored data from restaurants API_URL = https://opentable.herokuapp.com/api/restaurants"

  task :pull => :environment do     
    puts "Pulling data from https://opentable.herokuapp.com/api/restaurants"

    OpenTablePuller.pull.each do |restaurant|

      table_values = { name: restaurant[:name], 
                       address: restaurant[:address],
                       city: restaurant[:city],
                       state: restaurant[:state],
                       postal_code: restaurant[:postal_code],
                       phone: restaurant[:phone],
                       price: restaurant[:price],
                       reserve_url: restaurant[:reserve_url],
                       image_url: restaurant[:image_url]
                     }
      
        Restaurant.create(table_values)

    end
  end
end