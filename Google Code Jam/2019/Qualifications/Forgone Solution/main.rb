def split_n(n)
  a = n.split('')
  b = ['0']*a.count

  a.each_with_index do |digit, index|
    if digit == '4'
      a[index] = '3'
      b[index] = '1'
    end
  end

  b.shift while b.first == '0'

  return a.join(''), b.join('')
end

n = gets.to_i
ns = []

n.times do
  ns << gets.strip
end

ns.each_with_index do |n, i|
  a, b = split_n(n)
  puts "Case ##{i+1}: #{a} #{b}"
end
