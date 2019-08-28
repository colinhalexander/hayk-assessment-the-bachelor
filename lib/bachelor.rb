require "pry"

def get_first_name_of_season_winner(data, season)
  contestants = data[season]
  #binding.pry
  season_winner = contestants.find do |contestant|
    contestant["status"] == "Winner"
  end
  season_winner["name"].split[0]
end

def all_contestants(data)
  all_contestants = data.values.flatten
end

def get_contestant_name(data, occupation)
  all_contestants = all_contestants(data)
  all_contestants.find {|contestant| contestant["occupation"] == occupation}["name"]
end

def count_contestants_by_hometown(data, hometown)
  all_contestants(data).count do |contestant|
    contestant["hometown"] == hometown
  end
end

def get_occupation(data, hometown)
  all_contestants(data).find {|contestant| contestant["hometown"] == hometown}["occupation"]
end

def get_average_age_for_season(data, season)
  sum = data[season].reduce(0) {|sum, contestant| sum + contestant["age"].to_i}
  sum / data[season].length
end

