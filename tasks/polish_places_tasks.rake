namespace :polish_places do
 desc "Creating Places and Provinces dbtables and filling them with GUS data"
 task :install =>:environment do
    puts 'Installing Polish Places (please wait)'
    CreateProvinces.migrate(:up)
    CreatePlaces.migrate(:up)
    

  end
 
  task :uninstall =>:environment do
    puts 'Uninstalling Polish Places (please wait)'
    CreatePlaces.migrate(:down)
    CreateProvinces.migrate(:down)
  end
end





