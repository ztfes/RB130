class Device
  attr_reader :recordings
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen(&block)
    record(block.call) if block_given?
  end

  def play
    puts recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

# ALTERNATE SOLUTION

# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     return unless block_given?
#     recording = yield
#     record(recording)
#   end

#   def play
#     puts @recordings.last
#   end
# end