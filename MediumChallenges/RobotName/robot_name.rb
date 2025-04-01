=begin

PROBLEM

  Initial boot assigns name to robot
  Factory resetting robot wipes old name, regenerates new one
  Names should be random

  Cannot use the same name twice

EXAMPLE

  robot = Robot.new("RX837")
  robot.name = "RX837"
  robot.factory_reset
  robot.name = "BC811"

DATA

  Robots are objects of ROBOT class
  Robot names are strings / instance varaibles
  Names adhere to this regex: /^[A-Z]{2}\d{3}$/
    ^         - Start of the string
    [A-Z]{2}  - Exactly 2 uppercase letters (A to Z)
    \d{3}     - Exactly 3 digits (0-9)
    $         - End of the string

ALGO

  Generate new name (NAME1)
    require 'regexp_examples'
    /^[A-Z]{2}\d{3}$/.random_example
    robot.name = /^[A-Z]{2}\d{3}$/.random_example
  Factory reset
    robot.name = /^[A-Z]{2}\d{3}$/.random_example
  Compare new name (NAME2) with old name (NAME1)
    Should not be equal

=end

class Robot
  LETTER = ('A'..'Z').to_a
  NUMS = ('0'..'9').to_a

  attr_reader :name

  def initialize
    @name = nil
    @@robot_names = []
  end

  def name_generator
    [LETTER.sample, LETTER.sample, NUMS.sample, NUMS.sample, NUMS.sample].join.to_s
  end

  def random_name
    @name = name_generator
  end

  def name
    if @name
      @name
    else
      new_name = nil
      loop do
        new_name = random_name
        break if !@@robot_names.include?(new_name)
      end
      @name = new_name
      @@robot_names << @name
      @name
    end
  end

  def reset
    @@robot_names.delete(@name)
    @name = nil
    name
  end
end
