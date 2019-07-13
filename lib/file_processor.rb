class FileProcessor
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def normalize_file
    file = File.read(file_path)
    file = file.gsub("\t", " ").split("\n").map{ |row| Array(row.split(" ")) }
    file.delete_at(0)
    result_to_hash(file)
  end

  private

  def result_to_hash(race_laps)
    result = []
    race_laps.each do |lap|
      racer = {}
      racer[:code]     = lap[1].to_i
      racer[:name]     = lap[3]
      racer[:lap]      = lap[4].to_i
      racer[:duration] = lap[5]
      racer[:speed]    = lap[6]
      racer[:end_at]   = lap[0]
      result << racer
    end
    result
  end
end
