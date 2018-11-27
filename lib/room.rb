class Game
  attr_accessor(:game_difficulty, :levels, :current_location, :has_key)

  def initialize(game_difficulty)
    @current_location = 0
    @has_key = false
    @levels = []
    @game_difficulty = game_difficulty
    @game_difficulty.times do |level|
      @levels.push(MainRoom.new(level))
    end
  end
end

class SideRoom
  attr_accessor(:randomdoors, :special, :branch_level)

  def initialize(branch_level)
    @special = false
    @randomdoors = []
    @branch_level = branch_level
    build_branches()
  end

  def build_branches
    if @branch_level == 1
      @randomdoors.push(SideRoom.new(2))
      @randomdoors.push(SideRoom.new(2))
    elsif @branch_level == 2
      doors = 2
      doors.times do
        @randomdoors.push(SideRoom.new(3))
      end
    elsif @branch_level == 3
      random_number = 1
      if random_number >= 1
        @special = true
      end
    end
  end
end

class MainRoom
  attr_accessor(:lockeddoor, :randomdoors, :id)

  def initialize(level)
    @id = level + 1
    @randomdoors = []
    @lockeddoor = []
    # @@game_difficulty = game_difficulty

    room_1_a = SideRoom.new(1)
    room_1_b = SideRoom.new(1)
    @randomdoors.push(room_1_a)
    @randomdoors.push(room_1_b)
  end
end
