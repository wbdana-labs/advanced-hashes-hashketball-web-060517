require 'pry'

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash.each do |team, team_data|
    team_data[:players].each do |name, stats|
      if player == name
        return stats[:points]
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |loc, team_data|
    team_data[:players].each do |name, stats|
      if player == name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |loc, team_data|
    if name == team_data[:team_name]
      return team_data[:colors]
    end
  end
end

def team_names
  name_arr = []
  game_hash.each do |loc, team_data|
    name_arr << team_data[:team_name]
  end
  name_arr
end

def player_numbers(team)
  numbers_arr = []
  game_hash.each do |loc, team_data|
    if team == team_data[:team_name]
      team_data[:players].each do |player, stat|
        numbers_arr << stat[:number]
      end
    end
  end
  numbers_arr
end

def player_stats(name)
  game_hash.each do |loc, team_data|
    team_data[:players].each do |player, stats|
      if name == player
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  shoe_sizes = []
  game_hash.each do |loc, team_data|
    team_data[:players].each do |player, stats|
      shoe_sizes << stats[:shoe]
      if stats[:shoe] == shoe_sizes.max
        return stats[:rebounds]
      end
    end
  end
end

def most_points_scored
  points_scored = []
  game_hash.each do |loc, team_data|
    team_data[:players].each do |player, stats|
      points_scored << stats[:points]
    end
  end
  game_hash.each do |loc, team_data|
    team_data[:players].each do |player, stats|
      if stats[:points] == points_scored.max
        return player
      end
    end
  end
end

def winning_team
  home_points_scored = []
  away_points_scored = []
  game_hash.each do |loc, team_data|
    if loc == :home
      team_data[:players].each do |player, stats|
        home_points_scored << stats[:points]
      end
    elsif loc == :away
      team_data[:players].each do |player, stats|
        away_points_scored << stats[:points]
      end
    end
  end
  home_total = home_points_scored.inject{|sum, n| sum + n}
  away_total = away_points_scored.inject{|sum, n| sum + n}
  if home_total > away_total
    return game_hash[:home][:team_name]
  elsif away_total > home_total
    return game_hash[:home][:team_name]
  end
end

def player_with_longest_name
  length_arr = []
  home_team = game_hash[:home][:players].keys
  away_team = game_hash[:away][:players].keys
  home_team.each{|p| length_arr << p.length}
  away_team.each{|p| length_arr << p.length}
  game_hash.each do |loc, team_data|
    team_data[:players].each do |name, stats|
      if length_arr.max == name.length
        return name
      end
    end
  end
end

def most_steals
  steal_arr = []
  game_hash.each do |loc, team_data|
    team_data[:players].each do |player, stats|
      steal_arr << stats[:steals]
    end
  end
  game_hash.each do |loc, team_data|
    team_data[:players].each do |player, stats|
      if stats[:steals] == steal_arr.max
        return player
      end
    end
  end
end

def long_name_steals_a_ton?
  most_steals == player_with_longest_name
end
