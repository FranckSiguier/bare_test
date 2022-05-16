require 'rspec/autorun'
require_relative '../lib/utils'

describe '#is_move_allowed' do
  it "should return true if the robot is not facing an edge" do 
    expect(is_move_allowed({x:0,y:0,o:'N'})).to eq(true)
  end

  it "should return false if the robot is facing an edge" do
    expect(is_move_allowed({x:0,y:5,o:'N'})).to eq(false)
    expect(is_move_allowed({x:0,y:0,o:'S'})).to eq(false)
    expect(is_move_allowed({x:0,y:0,o:'W'})).to eq(false)
    expect(is_move_allowed({x:5,y:0,o:'E'})).to eq(false)
  end
end

describe "#move_the_robot" do
  it "should increment y by 1 if the robot is facing north" do
    expect(move_the_robot({x:0,y:0,o:'N'})).to eq({x:0,y:1,o:'N'})
  end

  it "should increment x by 1 if the robot is facing east" do
    expect(move_the_robot({x:0,y:0,o:'E'})).to eq({x:1,y:0,o:'E'})
  end

  it "should decrement x by 1 if the robot is facing west" do
    expect(move_the_robot({x:5,y:5,o:'W'})).to eq({x:4,y:5,o:'W'})
  end

  it "should decrement y by 1 if the robot is facing south" do
    expect(move_the_robot({x:5,y:5,o:'S'})).to eq({x:5,y:4,o:'S'})
  end
end

describe "#turn_the_robot" do 
  it "should return N when robot is facing E and direction is LEFT" do
    expect(turn_the_robot("LEFT", "E")).to eq("N")
  end

  it "should return W when robot is facing N and direction is LEFT" do
    expect(turn_the_robot("LEFT", "N")).to eq("W")
  end

  it "should return S when robot is facing W and direction is LEFT" do
    expect(turn_the_robot("LEFT", "W")).to eq("S")
  end

  it "should return E when robot is facing S and direction is LEFT" do
    expect(turn_the_robot("LEFT", "S")).to eq("E")
  end

  it "should return N when robot is facing W and direction is RIGHT" do
    expect(turn_the_robot("RIGHT", "W")).to eq("N")
  end

  it "should return E when robot is facing N and direction is RIGHT" do
    expect(turn_the_robot("RIGHT", "N")).to eq("E")
  end

  it "should return S when robot is facing E and direction is RIGHT" do
    expect(turn_the_robot("RIGHT", "E")).to eq("S")
  end

  it "should return W when robot is facing S and direction is RIGHT" do
    expect(turn_the_robot("RIGHT", "S")).to eq("W")
  end
end

describe "#place_the_robot" do
  it "should return false when the position is not right" do
    expect(place_the_robot("PLACE89N")).to eq(false)
  end

  it "should return false when the command does not match the rules" do
    expect(place_the_robot("PLACEsdfsdf")).to eq(false)
  end

  it "should return the position when the command is right" do
    expect(place_the_robot("PLACE12N")).to eq({x:0,y:1,o:'N'})
  end
end
