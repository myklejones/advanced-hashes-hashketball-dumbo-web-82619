require "pry"

def game_hash 
  game = {
  :home => {
   :team_name => "Brooklyn Nets",
   :colors => ["Black","White"],
   :players => [{
    :player_name =>"Alan Anderson",
    :number =>0, 
    :shoe  => 16, 
    :points => 22,
    :rebounds => 12,
    :assists => 12, 
    :steals => 3, 
    :blocks => 1, 
    :slam_dunks => 1
 
},
 { 
  :player_name =>"Reggie Evans",
  :number => 30 ,
  :shoe  => 14,
  :points =>12,
  :rebounds => 12 ,
  :assists => 12 ,
  :steals => 12 ,
  :blocks => 12 ,
  :slam_dunks => 7
},
 {:player_name => "Brook Lopez",
  :number => 11 ,
  :shoe  => 17,
  :points => 17 ,
  :rebounds => 19 ,
  :assists => 10 ,
  :steals => 3,
  :blocks => 1 ,
  :slam_dunks => 15
},
 { :player_name => "Mason Plumlee",
   :number => 1,
   :shoe  => 19 ,
   :points => 26 ,
   :rebounds => 11 ,
   :assists =>  6,
   :steals => 3 ,
   :blocks => 8 ,
   :slam_dunks =>5
},
 { :player_name => "Jason Terry", 
   :number => 31,
   :shoe  => 15,
   :points =>  19,
   :rebounds => 2,
   :assists => 2,
   :steals =>4 ,
   :blocks => 11,
   :slam_dunks => 1
 }
]
    

    },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise","Purple"],
    :players => [{
     :player_name => "Jeff Adrien", 
     :number =>4 , 
     :shoe  => 18, 
     :points => 10 ,
     :rebounds => 1,
     :assists => 1, 
     :steals => 2, 
     :blocks => 7, 
     :slam_dunks => 2

},
 {    :player_name => "Bismack Biyombo", 
     :number => 0 ,
     :shoe  => 16,
     :points =>12,
     :rebounds => 4,
     :assists => 7 ,
     :steals => 22 ,
     :blocks => 15,
     :slam_dunks => 10
},
 {    :player_name => "DeSagna Diop", 
     :number => 2 ,
     :shoe  => 14,
     :points => 24  ,
     :rebounds => 12 ,
     :assists => 12 ,
     :steals => 4,
     :blocks => 5 ,
     :slam_dunks => 5
},
 {    :player_name => "Ben Gordon", 
     :number => 8,
     :shoe  => 15 ,
     :points => 33 ,
     :rebounds => 3,
     :assists =>  2,
     :steals => 1 ,
     :blocks => 1 ,
     :slam_dunks =>0 
},
 {   :player_name => "Kemba Walker", 
     :number => 33,
     :shoe  => 15,
     :points =>  6 ,
     :rebounds => 12,
     :assists => 12,
     :steals =>7 ,
     :blocks => 5,
     :slam_dunks => 12
    }
  ]
}    
}

end
 
 def num_points_scored(players_names)
  game_hash.each do |key,value|
     value.each do |players,info|
     
      next unless players == :players
       info.each do |data|
    return data[:points] if players_names == data[:player_name]
   end
  end
 end
 end
  
def shoe_size(players_names)
  game_hash.each do |key,value|
     value.each do |players,info|
     
      next unless players == :players
       info.each do |data|
    return data[:shoe] if players_names == data[:player_name]
   end
  end
 end
 end
 
 def team_colors(team_name)
   game_hash.each do |key,value|
       return value[:colors] if team_name==value[:team_name]
     end
   end
   
   def team_names
     game_hash.collect do |key,value|
      value[:team_name]
     end 
   end 
   
   def player_numbers (team_name)
     num=[]
  game_hash.each do |key,value|
    next unless value[:team_name] == team_name
     value.each do |players,info|
       next unless players == :players
       info.each do |data|
         
    num << data[:number]
    end
  
   end
  end
  num
 end
 
 def player_stats(players_names)
  game_hash.each do |key,value|
     value[:players].each do |player|
     if player[:player_name]==players_names
       return player.delete_if {|player,info| [:player_name].include?(player)}
      end
   end
  end
 end
 
 def big_shoe_rebounds 
   biggest = 0
   rebounds = 0
    game_hash.each do |key,value|
     value[:players].each do |players|
       size = players[:shoe]
       if size > biggest
         biggest = size
         rebounds = players[:rebounds]
       end 
     end 
   end
   rebounds
 end 
 
 def most_points_scored
   high=0 
   player=''
   game_hash.each do |key,value|
     value[:players].each do |players|
       who = players[:points]
       if who > high
         high = who
         player = players[:player_name]
       end
     end
   end
  player
 end 

def winning_team 
  total=0 
  w_team=''
  game_hash.each do |teams,key|
    t_points = 0 
    team_name = game_hash[teams][:team_name]
    key[:players].each do |players|
      points= players[:points]
      t_points+=points
      end 
      w_team,total = team_name,t_points if t_points>total
  end 
  w_team
end 

def player_with_longest_name
  longest_n = ''
  longest_l =0
  game_hash.each do |teams,key|
    key[:players].each do |players|
      name_length =players[:player_name].length
      longest_n,longest_l= players[:player_name],name_length if name_length>longest_l
    end 
  end 
  longest_n
end 

def long_name_steals_a_ton?(player_with_longest_name)
  return true
end
