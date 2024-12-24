RIGHT = 'E'
DOWN = 'S'

def find_path(dimension, path2)
  path2 = path2.split('')
  path = path2.map{ |move| move == RIGHT ? DOWN : RIGHT }

  path.join('')
end

n = gets.to_i
cases = []

n.times do
  cases << { 
    dimension: gets.to_i,
    path: gets.strip
  }
end

cases.each_with_index do |c, index|
  path = find_path(c[:dimension], c[:path])
  puts "Case ##{index+1}: #{path}"
end
