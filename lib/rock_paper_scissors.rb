class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    if player1[1] =~ /^[^RPS]$/ || player2[1] =~ /^[^RPS]$/
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    end
    if player1[1] == player2[1]
      return player1
    elsif player1[1] == "R"
      if player2[1] == "P"
        return player2
      else
        return player1
      end
    elsif player1[1] == "P"
      if player2[1] == "S"
        return player2
      else
        return player1
      end
    else
      if player2[1] == "R"
        return player2
      else
        return player1
      end
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].kind_of?(Array)
      return self.winner(tournament_winner(tournament[0]), tournament_winner(tournament[1]))
    else
      return self.winner(tournament[0], tournament[1])
    end
  end

end
