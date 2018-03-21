require_relative 'die'

class Racer
  attr_reader :players, :die, :length, :board_position

  def initialize(players, die, length=30)
    @players = players
    @die = die
    @length = length
    @board_position = Hash[@players.map {|start| [start, 0]}]
  end

  def finished?
    @board_position.each { |player, position| return true if position >= @length}
    false
  end

  def winner
    @board_position.max_by { |player, position| position }[0]
  end

  def advance_player
    @board_position.map do |player, position|
      position += die.roll
      @board_position[player] = position
    end
  end

  def board_visualization
    create_board = []
    @board_position.each do |player, position|
      player_track = Array.new(@length, "-")
      player_track[@board_position[player]] = player
      create_board << player_track
    end
    create_board.each { |board| puts board.join}
  end
end
