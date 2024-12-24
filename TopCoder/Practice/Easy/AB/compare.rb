def calc_k s
  return -1 unless s
  b_count = 0
  count = 0
  s.split('').reverse_each do |char|
    if char == 'B'
      b_count += 1
    else
      count += b_count
    end
  end
  count
end

abj = File.readlines(ARGV[0]).map{|line| line.strip.split(',')}
ab1 = File.readlines(ARGV[1]).map{|line| line.strip.split(',')}

res = {}
abj.each do |line|
  key = "#{line[0]},#{line[1]}"
  res[key] = { correct: line[2] }
end

diff = []
ab1.each do |line|
  key = "#{line[0]},#{line[1]}"
  res[key][:mine] = line[2]

  if calc_k(res[key][:correct]) != calc_k(res[key][:mine])
    diff << key
  end
end

key = diff.first
puts diff.count, key, res[key]
