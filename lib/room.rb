class Game
  attr_accessor(:game_difficulty, :levels, :current_location, :current_room, :current_level, :current_distance :has_key)

  def initialize(game_difficulty)
    @current_level = 0
    @current_room = 0
    @current_distance = 0
    @has_key = false
    @levels = []
    @game_difficulty = game_difficulty
    @game_difficulty.times do |level|
      @levels.push(MainRoom.new(level))
    end
  end

  def find_room(id)
    tier1 = @levels.randomdoors # array of 2
    tier2a = @levels.randomdoors[0].randomdoors
    tier2b = @levels.randomdoors[1].randomdoors
    tier3a = @levels.randomdoors[0].randomdoors[0].randomdoors
    tier3b = @levels.randomdoors[1].randomdoors[0].randomdoors
    tier3c = @levels.randomdoors[1].randomdoors[1].randomdoors
    tier3d = @levels.randomdoors[1].randomdoors[1].randomdoors

    @levels.find()
  end
end

class SideRoom
  attr_accessor(:randomdoors, :special, :branch_level, :id)

  def initialize(branch_level, id)
    @id = branch_level.to_s + id.to_s
    @special = false
    @randomdoors = []
    @branch_level = branch_level
    build_branches()
  end

  def build_branches
    if @branch_level == 1
      doors = 2
      count = 1
      doors.times do
        @randomdoors.push(SideRoom.new(2, count))
        count = count + 1
      end
    elsif @branch_level == 2
      doors = 2
      count = 1
      doors.times do
        @randomdoors.push(SideRoom.new(3, count))
        count = count + 1
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
