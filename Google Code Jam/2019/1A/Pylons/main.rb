def calc_diagonal_impact(i, j, r, c)
  up = i
  down = r - 1 - i
  left = j
  right = c - 1 - j

  [up, right].min + [right, down].min + [down, left].min + [left, up].min
end

def find_and_remove(options, lc)
  return options.shift unless lc

  index = nil
  options.each_with_index do |o, i|
    next if o[0] == lc[0]
    next if o[1] == lc[1]
    next if o[0] - o[1] == lc[0] - lc[1]
    next if o[0] + o[1] == lc[0] + lc[1]

    index = i
    break
  end

  return nil unless index
  options.delete_at(index)
end

def update_impacts(choice, impacts, r, c)
  # row
  (0..c-1).each do |j|
    ci = choice[0]
    cj = choice[1]
    impacts["#{ci},#{j}"] -= 1 unless j == cj
  end

  # column
  (0..r-1).each do |i|
    ci = choice[0]
    cj = choice[1]
    impacts["#{i},#{cj}"] -= 1 unless i == ci
  end

  # up, right
  i = choice[0]-1
  j = choice[1]+1
  while i >= 0 and j < c
    impacts["#{i},#{j}"] -= 1
    i -= 1
    j += 1
  end

  # right, down
  i = choice[0]+1
  j = choice[1]+1
  while i < r and j < c
    impacts["#{i},#{j}"] -= 1
    i += 1
    j += 1
  end

  # down, left
  i = choice[0]+1
  j = choice[1]-1
  while i < r and j >= 0
    impacts["#{i},#{j}"] -= 1
    i += 1
    j -= 1
  end

  # left, up
  i = choice[0]-1
  j = choice[1]-1
  while i >= 0 and j >= 0
    impacts["#{i},#{j}"] -= 1
    i -= 1
    j -= 1
  end
end

def find_path(r, c)
  impacts = {}
  options = []

  min_impact = (r-1) + (c-1)

  (0..r-1).each do |i|
    (0..c-1).each do |j|
      impacts["#{i},#{j}"] = min_impact + calc_diagonal_impact(i, j, r, c)
      options << [i,j]
    end
  end

  path = []
  last_choice = nil
  while options.any?
    options = options.sort_by{|o| impacts["#{o[0]},#{o[1]}"] }.reverse

    choice = find_and_remove(options, last_choice)
    return nil unless choice
    path << choice
    update_impacts(choice, impacts, r, c)
    last_choice = choice
  end

  path
end

t = gets.to_i
(1..t).each do |i|
    r, c = gets.strip.split(' ').map(&:to_i)
    path = find_path(r, c)
    
    unless path
      puts "Case ##{i}: IMPOSSIBLE"
    else 
      puts "Case ##{i}: POSSIBLE"
      puts path.map{|p| "#{p[0]+1} #{p[1]+1}"}.join("\n")
    end
end
