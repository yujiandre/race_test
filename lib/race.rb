require_relative 'file_processor'
require_relative 'racer_stats'

class Race
  attr_reader :result, :final_result

  def initialize(file = "race_log.txt")
    @result       = FileProcessor.new(file).normalize_file
  end

  def racers_result
    @final_result ||= racers_stats.racers
  end

  def winner
    racers_result.select { |racer| racer[:position] == 1 }.first
  end

  private

  def racers_stats
    racers = RacerStats.new(result)
  end
end
