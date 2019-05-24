require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_hash[:summer][:fourth_of_july][1]

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash[:winter].each do |key, value|

    value.push(supply)

  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

  holiday_hash[:spring][:memorial_day].push(supply)

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season] = {

    holiday_name => supply_array

  }

  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  ea = []

      holiday_hash.each do |key, value|
        value.each do |key1, value1|
          value1.each do |supply|
            ea.push(supply)
          end
        end
      end

      ea
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  str = ""
  season_arr = []
  days_arr = []
  items = []
  holiday_hash.each do |key, value|
    season_arr.push(key.capitalize.to_s)

    value.each do |key1, value1|
      days_arr.push(key1.to_s.gsub(/_/, " "))

      value1.each do |item|
        items.push(item)
      end
    end
  end
  
  days_arrcap = []

  days_arr.each do |arr|
    str_cap = arr.split.map(&:capitalize).join(' ')
    days_arrcap.push(str_cap)
    
  end
  
  
  puts season_arr.inspect
  puts days_arrcap.inspect
  puts items.inspect

  def print_season(season_arr)
    season_arr.each do |season|
    puts "#{season}:"
    yield
    end
  end

  winter_str = "#{season_arr[0]}:
  #{days_arrcap[0]}: #{items[0]}, #{items[1]}
  #{days_arrcap[1]}: #{items[2]}"

  summer_str = "#{season_arr[1]}:
  #{days_arrcap[2]}: #{items[3]}, #{items[4]}"

  fall_str = "#{season_arr[2]}:
  #{days_arrcap[-2]}: #{items[-2]}"

  spring_str = "#{season_arr[-1]}:
  #{days_arrcap[-1]}: #{items[-1]}"

  puts winter_str
  puts summer_str
  puts fall_str
  puts spring_str

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

end
