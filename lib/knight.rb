require 'set'

class Knight
  def initialize(start_pos, end_pos)
    @start_pos = start_pos
    @end_pos = end_pos
    @moves = [              # Possible knight moves
      [2, 1], [2, -1], [-2, 1], [-2, -1],
      [1, 2], [1, -2], [-1, 2], [-1, -2]
    ]
    @visited = Set.new # Hash to track visited positions
  end


  def inside_board?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end


  def valid_moves(pos)
    can_move_to = []

    @moves.each do |move|
      pos_to = [pos[0] + move[0], pos[1] + move[1]]

      if inside_board?(pos_to) && !@visited.include?(pos_to)
        can_move_to << pos_to 
      end
    end

    can_move_to
  end


  def find_path
    queue = [[@start_pos, [@start_pos]]]
    @visited.add(@start_pos)

    until queue.empty?
      current_pos, path = queue.shift

      return path if current_pos == @end_pos

      valid_moves(current_pos).each do |move|
        next if @visited.include?(move)

        @visited.add(move)
        queue << [move, path + [move]]
      end
    end
  end

end
