class Pawn < Piece
  attr_accessor :left_passant, :right_passant

  def initialize(board, pos, color)
    super(board, pos, color)
    @left_passant = false
    @right_passant = false
  end

  def moves
    moves = []

    if self.color == :white
      moves += forward_moves(-1)
      moves += forward_moves(-2) if self.pos[0] == 6
      moves += diagonal_moves(-1,1) + diagonal_moves(-1,-1)
    else
      moves += forward_moves(1)
      moves += forward_moves(2) if self.pos[0] == 1
      moves += diagonal_moves(1,1) + diagonal_moves(1,-1)
    end

    moves
  end

  def forward_moves(amount)
    moves = []
    move = [self.pos[0] + amount, self.pos[1]]
    moves << move if @board[*move].nil?
    moves
  end

  def diagonal_moves(x,y)
    moves = []
    move = [self.pos[0] + x, self.pos[1] + y]

      moves << move if !@board[*move].nil? && @board[*move].color != self.color
      moves << move if @left_passant && y == -1
      moves << move if @right_passant && y == 1

    moves
  end
end
