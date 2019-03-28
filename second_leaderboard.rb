require 'date'
class LeaderBoard
  def initialize
    @good_scores = Hash.new{ |h,k| h[k] = [] }
    @averages = Hash.new
  end

  def add_score(player_id, score, date)
    today = Date.today
    good_dates = Hash.new
    if (today - date ) < 7
      good_dates[score] = date
      @good_scores[player_id].push(good_dates)
    end
    player_length = @good_scores[player_id].length
    i = 0.0
    if @good_scores[player_id].first
        @good_scores[player_id].each do |item|
          i += item.keys.first
      end
    end
    average = i / player_length
    @averages[player_id] = average.round(1)

    @averages[player_id]
  end

  def top(num_players)
    sorted_scores = @averages.sort_by{|k,v| v}.reverse.to_h
    sorted_keys = sorted_scores.keys
    i = 0
    selected_players = []
    length = nil
    if num_players <= @good_scores.length
      length = num_players
    elsif
      length = @good_scores.length
    end
    length.times do
      selected_players << sorted_keys[i]
      i += 1
    end

    selected_players
  end

  def reset(player_id)
    @good_scores[player_id] = []
    @averages[player_id] = []
  end
end

leader_board = LeaderBoard.new()
leader_board.add_score(1, 90, Date.new(2018, 03, 25))
leader_board.add_score(1, 80, Date.new(2019, 03, 25))
leader_board.add_score(1, 70, Date.new(2019, 03, 24))
leader_board.add_score(1, 85, Date.new(2019, 02, 25))
puts(leader_board.add_score(1, 75, Date.new(2019, 03, 21)) == 75)
leader_board.add_score(2, 90, Date.new(2019, 03, 25))
leader_board.add_score(2, 50, Date.new(2019, 02, 25))
puts(leader_board.add_score(2, 80, Date.new(2019, 03, 22)) == 85)
leader_board.add_score(3, 70, Date.new(2019, 03, 25))
leader_board.add_score(3, 60, Date.new(2019, 03, 25))
puts(leader_board.add_score(3, 80, Date.new(2017, 03, 22)) == 65)
puts(leader_board.top(3) == [2, 1, 3])
