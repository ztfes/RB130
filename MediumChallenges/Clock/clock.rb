=begin

INPUT: (HH, MM) as integers
INTERMEDIATE: Calculation to convert HH, and MM inputs as HH:MM format
              Calcualation to add/subtract minutes from clock
OUTPUT: Clock object --> time displayed as 'HH:MM'

HINTS from Test Cases:

  - Clock class
  - Clock#at method, two integer args
  - Clock#- method
  - Clock#+ method
  - Clock#to_s

RULES:  1.) Two clock objects that represent the same time should be equal to each other.
        2.) You may not use any built-in date or time functionality; just use arithmetic operations.
        3.) You should not mutate Clock objects when adding and subtracting minutes
        4.) Clock is independent of date.

DATA:  

  - clock objects
  - integers (minutes)

=end

class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = 1440

  attr_accessor :hours, :minutes, :time, :total_minutes
  def initialize(hh,mm = 0)
    @hours = hh
    @minutes = mm
    @time = [hh, mm]
    @total_minutes = hh*60 + mm
  end

  def self.at(hh,mm=0)
    Clock.new(hh,mm)
  end

  def displayed_minutes
    if minutes == 0
      formatted_minutes = '00'
    elsif minutes < 10
      formatted_minutes = "0#{minutes}"
    else
      formatted_minutes = minutes
    end
    formatted_minutes
  end

  def displayed_hours
    if hours < 10
      formatted_hours = "0#{hours}"
    else
      formatted_hours = hours
    end
    formatted_hours
  end

  def to_s
    "#{displayed_hours}:#{displayed_minutes}"
  end

  def recalc_time(modified_time_in_minutes)

    if modified_time_in_minutes > 1440
      @total_minutes = modified_time_in_minutes % 1440
      @hours = @total_minutes / 60
      @minutes = @total_minutes % 60
    elsif modified_time_in_minutes < 0
      @total_minutes = modified_time_in_minutes % 1440
      @hours = @total_minutes / 60
      @minutes = @total_minutes % 60
    elsif modified_time_in_minutes >= 0
      @hours = modified_time_in_minutes / 60
      @minutes = modified_time_in_minutes % 60
    end
  end

  def new_clock
    Clock.at(hours, minutes)
  end

  def -(subtracted_minutes)
    @total_minutes -= subtracted_minutes
    recalc_time(@total_minutes)
    new_clock
  end

  def +(added_minutes)
    @total_minutes += added_minutes
    recalc_time(@total_minutes)
    new_clock
  end

  def ==(other_clock)
    self.total_minutes == other_clock.total_minutes
  end
end
