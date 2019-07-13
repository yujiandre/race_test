class RacerStats
  attr_reader :result

  LAPS_QTY = 4

  def initialize(result)
    @result = result
  end

  def racers
    racers_result
  end

  private

  def racers_result
    racers = []
    racers_ids.each do |id|
      racer = {}
      laps = result.select { |lap| lap[:code] == id }
      racer[:code]          = id
      racer[:name]          = laps.first[:name]
      racer[:laps_qty]      = laps.map{ |lap| lap[:lap] }.sort.last
      racer[:duration]      = racer_duration(laps)
      racer[:duration_time] = milliseconds_to_minutes(racer[:duration])
      racer[:position]      = 0
      racers << racer
    end
    racers_position(racers)
    racers
  end

  def racers_position(racers)
    laps = LAPS_QTY
    position = 1
    for i in 0..LAPS_QTY
      racers_with_laps = racers.select { |racer| racer[:laps_qty] == laps }
      racers_with_laps = racers_with_laps.sort_by { |x| x[:duration] }
      racers_with_laps.each do |racer|
        racer[:position] = position
        position = position + 1
      end
      laps = laps - 1
    end
  end

  def racer_duration(laps)
    milliseconds = 0
    durations = laps.map { |lap| lap[:duration] }
    durations.each do |duration|
      min, sec, millisecs = duration.gsub(/[:.]/, ",").split(",")
      milliseconds = milliseconds + (min.to_i * 60 + sec.to_i) * 1000 + millisecs.to_i
    end
    milliseconds
  end

  def milliseconds_to_minutes(milliseconds)
    minute, millisecs = milliseconds.divmod(1000 * 60)
    secs, millisecs   = millisecs.divmod(1000)
    "#{minute} minutes, #{secs} seconds, #{millisecs} milliseconds"
  end

  def racer_laps(racer_id)
    racer_laps = result.select do |racer|
      racer[:code] == racer_id
    end
  end

  def racers_ids
    racer_ids = result.map do |racer|
      racer[:code]
    end.uniq
  end
end
