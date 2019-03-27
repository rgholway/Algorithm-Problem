class LeaderBoard
  def initialize()
    @scores = Hash.new{|h,k| h[k] = [] }
    @averages = Hash.new{|h,k| h[k] = [] }
  end

  def add_score(player_id, score)
    @scores[player_id].push(score)
    player_length = @scores[player_id].length
    i = 0.0
    @scores[player_id].each do |item|
      i += item
    end
    average_score = i / player_length
    @averages[player_id].replace([average_score])

    @averages[player_id][0].round(1)
  end

  def top(num_players)
    sorted_scores = @averages.sort_by{|k,v| v}.reverse.to_h
    sorted_keys = sorted_scores.keys
    i = 0
    selected_players = []
    num_players.times do
      selected_players << sorted_keys[i]
      i += 1
    end

    selected_players
  end

  def reset(player_id)
    @scores[player_id] = []
    @averages[player_id] = []
  end
end

leader_board = LeaderBoard.new()
leader_board.add_score(1, 48)
leader_board.add_score(1, 49)
puts(leader_board.add_score(1, 49) == 48.7)
puts(leader_board.add_score(2, 80) == 80)
puts(leader_board.add_score(2, 70) == 75)
puts(leader_board.add_score(2, 60) == 70)
puts(leader_board.add_score(3, 90) == 90)
puts(leader_board.add_score(3, 85) == 87.5)

puts(leader_board.top(3) == [3, 2, 1])
puts(leader_board.top(2) == [3, 2])
leader_board.reset(3)
puts(leader_board.top(3) == [2, 1, 3])
leader_board.add_score(3, 100)
puts(leader_board.top(3) == [3, 2, 1])
