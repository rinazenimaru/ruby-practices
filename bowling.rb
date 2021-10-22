score = ARGV[0]
scores = score.split(',')
frames = []
frame = []
max_scores_size = scores.size

scores.each.with_index(1) do |s, index|
  if s == 'X'
    frame << 10
    if frames.size != 9
      frames << frame
      frame = []
    elsif frames.size == 9 && index == max_scores_size
      frames << frame
    end
  else
    frame << s.to_i
    if frame.size == 2 && frames.size != 9
      frames << frame
      frame = []
    elsif frames.size == 9 && (frame.size == 2 && frame.sum != 10) || (frame.size == 3)
      frames << frame
      break
    end
  end
end

pp frames

total_score = 0

frames.each_with_index do |current_frame, index|
  next_frame = frames[index + 1]
  next_next_frame = frames[index + 2]
  total_score += current_frame.sum
  total_score += next_frame[0] if current_frame.sum == 10 && current_frame.size == 2 && !next_current_frame.nil?
  next unless current_frame.sum == 10 && current_frame.size == 1

  total_score += next_frame[0] unless next_frame.nil?

  if !next_frame.nil? && next_frame.size > 1
    total_score += next_frame[1]
  elsif !next_frame.nil? && next_frame.size == 1
    total_score += next_next_frame[0]
  end
end

pp total_score
