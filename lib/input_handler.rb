class InputHandler
  def initialize(input_message)
    @input_message = input_message
  end

  def call
    puts input_message
    gets.chomp
  end

  private

  attr_reader :input_message
end
