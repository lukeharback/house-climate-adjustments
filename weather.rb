require 'csv'

def main
  weather = CSV.read("hbt-apt.csv", headers: true)
  
  heating_wrapped = []
  heating_not_wrapped = []
  
  weather.each do |row|
    if row["Minimum temperature (°C)"].to_f < 5 && row["Maximum temperature (°C)"].to_f < 12 && row["Sunshine (hours)"].to_f < 2.5
      heating_wrapped.push(row.clone)
      heating_not_wrapped.push(row.clone)
    elsif row["Minimum temperature (°C)"].to_f < 7 && row["Maximum temperature (°C)"].to_f < 14 && row["Sunshine (hours)"].to_f < 3.5
      heating_not_wrapped.push(row.clone)
    end
  end
  
  cooling_wrapped = []
  cooling_not_wrapped = []
  
  weather.each do |row|
    if row["Minimum temperature (°C)"].to_f > 15 && row["Maximum temperature (°C)"].to_f > 24 && row["Sunshine (hours)"].to_f > 4
      cooling_wrapped.push(row.clone)
      cooling_not_wrapped.push(row.clone)
    elsif row["Minimum temperature (°C)"].to_f > 17 && row["Maximum temperature (°C)"].to_f > 26 && row["Sunshine (hours)"].to_f > 5
      cooling_not_wrapped.push(row.clone)
    end
  end
  
  puts "==================="
  puts "THE GREAT COMFORT OFF 2018/19"
  puts " "
  puts "ROUND 1: HEATING"
  puts " "
  puts "  IF YOU WRAPPED THE HOUSE:"
  puts "  HEATING REQUIRED #{heating_wrapped.count} DAYS"
  puts " "
  puts "  IF YOU DO NOT WRAP THE HOUSE:"
  puts "  HEATING REQUIRED #{heating_not_wrapped.count} DAYS"
  puts " "
  puts "ROUND 2: COOLING"
  puts " "
  puts "  IF YOU WRAPPED THE HOUSE:"
  puts "  COOLING REQUIRED #{cooling_wrapped.count} DAYS"
  puts " "
  puts "  IF YOU DO NOT WRAP THE HOUSE:"
  puts "  COOLING REQUIRED #{cooling_not_wrapped.count} DAYS"
  puts " "
  puts "RESULTS"
  puts " "
  puts "  IF YOU WRAPPED THE HOUSE:"
  puts "  CLIMATE WOULD NEED TO BE ALTERED #{heating_wrapped.count + cooling_wrapped.count} DAYS"
  puts " "
  puts "  IF YOU DO NOT WRAP THE HOUSE:"
  puts "  CLIMATE WOULD NEED TO BE ALTERED #{heating_not_wrapped.count + cooling_not_wrapped.count} DAYS"
  puts "==================="
end

# run main
main
