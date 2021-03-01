class Questions
  def initialize()
    @num_1 = 0
    @num_2 = 0
    @answer = 0
  end

  def is_correct?(answer_input)
    answer_input == @answer
  end

  def ask
    @num_1 = rand(1..20)
    @num_2 = rand(1..20)
    @answer = @num_1 + @num_2
    [@num_1, @num_2]
  end
end
