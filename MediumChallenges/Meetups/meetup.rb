=begin

INPUT
  - Each object takes a month number (1-12) and a year (e.g., 2021).

OUTPUT

RULES
  - object should be able to determine the exact date of the meeting in the specified month and year
  - strings are case INsensitive
  - Days: 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'
  - Descriptors: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'.
    - 'teenth' --> 13th through 19th of month

EXAMPLE
  - If you ask for the 2nd Wednesday of May 2021, the object should be able to determine that the meetup for that month will occur on the 12th of May, 2021.

  meetup.day('Monday', 'first') == Date.civil(2013, 3, 4)

DATA STRUCTURE
  - string inputs, Date objects

ALGO
  --> Possible that one date could meet multiple criteria? i.e. fourth and last, third and teenth, etc. Which takes precedent??

  - (Meetup#Initialize)Construct new Meetup object
    - inputs: integer year, integer month
  - (Meetup#Day) Assign meetup day 
    - inputs: Day-of-Week, Occurence number in month ("descriptor")

    - steps:
      - For that year/month, find the number of days matching Day-of-Week input
      - Save those dates to array
      - loop over array
        - conditional
          - if descriptor = X, then select Y
              - i.e. 'first' would result in selection of first element in array
        - return selection

    - output: Date.civil object --- Class#Date?
  
=end

require 'date'

class Meetup
  DESCRIPTORS = ['first', 'second', 'third', 'fourth', 'fifth', 'last', 'teenth']
  DAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  TEENTHS = (13..19).to_a

  attr_reader :year, :month
  def initialize(year, month)
    @year = year
    @month = month
  end

  def number_of_days(day)
    Date.civil(year, month, 1).step(Date.civil(year, month, -1)).select do |actual_day|
      actual_day.wday == DAYS.index(day.capitalize)
    end
  end

  def teenth_day(array_of_days)
    array_of_days.select do |teenth_day|
      TEENTHS.include?(teenth_day.day)
    end[0]
  end


  def day(day, descriptor)
    # Save the number of days matching Day-of-Week input to an array
    arr = number_of_days(day)
    #return nil if arr.empty?
    case descriptor.downcase
      when 'first'
        arr[0]
      when 'second'
        arr[1]
      when 'third'
        arr[2]
      when 'fourth'
        arr[3]
      when 'fifth'
        arr[4]
      when 'last'
        arr[-1]
      when'teenth'
        teenth_day(arr)
      else
        nil
    end
  end
end

meetup = Meetup.new(2016, 10)
p meetup.day('Monday', 'teenth')
