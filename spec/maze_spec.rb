require ('rspec')
require ('./lib/room')
require ('pry')


describe('Game#initialize') do
  game = Game.new(1)
  it('creates a new game with one level') do
    expect(game.levels.length).to eq(1)
  end
end

describe('Game#initialize') do
  game = Game.new(1)
  it('creates a new game with one level and two side rooms attached') do
    expect(game.levels[0].randomdoors.length).to eq(2)
  end
end

describe('Game#initialize') do
  game = Game.new(1)
  it('creates a new game with two branches for each previous side room') do
    expect(game.levels[0].randomdoors[0].randomdoors.length).to eq(2)
  end
end

describe('Game#initialize') do
  game = Game.new(1)
  it('creates a new game with two branches fo each previous branched rooms') do
    expect(game.levels[0].randomdoors[0].randomdoors[0].randomdoors.length).to eq(2)
  end
end

describe('Game#initialize') do
  game = Game.new(1)
  it('creates a new game with terminal rooms of every possible branch') do
    expect(game.levels[0].randomdoors[0].randomdoors[0].randomdoors[0].randomdoors.length).to eq(0)
  end
end

describe('Game#initialize') do
  game = Game.new(1)
  it('creates a new game with terminal rooms of every possible branch') do
    expect(game.levels[0].randomdoors[0].randomdoors[0].randomdoors[0].randomdoors.length).to eq(0)
  end
end

describe('Game#initialize') do
  game = Game.new(1)
  it('checks that terminal rooms are "special"') do
    expect(game.levels[0].randomdoors[0].randomdoors[0].randomdoors[0].special).to eq(true)
    expect(game.levels[0].randomdoors[0].randomdoors[0].randomdoors[1].special).to eq(true)
    expect(game.levels[0].randomdoors[0].randomdoors[1].randomdoors[0].special).to eq(true)
    expect(game.levels[0].randomdoors[0].randomdoors[1].randomdoors[1].special).to eq(true)
    expect(game.levels[0].randomdoors[1].randomdoors[0].randomdoors[0].special).to eq(true)
    expect(game.levels[0].randomdoors[1].randomdoors[0].randomdoors[1].special).to eq(true)
    expect(game.levels[0].randomdoors[1].randomdoors[1].randomdoors[0].special).to eq(true)
    expect(game.levels[0].randomdoors[1].randomdoors[1].randomdoors[1].special).to eq(true)
  end
end

describe('Game#initialize') do
  game = Game.new(1)
  it('checks that terminal_rooms[-1] are "not special"') do
    expect(game.levels[0].randomdoors[0].randomdoors[0].special).to eq(false)
    expect(game.levels[0].randomdoors[0].randomdoors[1].special).to eq(false)
    expect(game.levels[0].randomdoors[1].randomdoors[0].special).to eq(false)
    expect(game.levels[0].randomdoors[1].randomdoors[0].special).to eq(false)
    expect(game.levels[0].randomdoors[1].randomdoors[1].special).to eq(false)
  end
end

describe('Game#initialize') do
  game = Game.new(1)
  it('checks that terminal_rooms[-2] are "not special"') do
    expect(game.levels[0].randomdoors[0].special).to eq(false)
    expect(game.levels[0].randomdoors[1].special).to eq(false)
  end
end
