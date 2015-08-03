class HumanPlayer
  attr_reader :name, :color

  def initialize(color, board)
    @color = color
    @name = name_prompt
    @board = board
  end

  def name_prompt
    puts "What is your name, #{@color.to_s}?"
    gets.chomp
  end

  def move
    @board.display_board
    print "#{@name.to_s} (#{@color}): Enter start and end position, divided by a dash: "

    begin
      start_pos, end_pos = gets.chomp.split('-')
      @board.move(start_pos, end_pos, @color)

    rescue BadMoveError => e
      puts e.message
    retry
    end
  end
end
