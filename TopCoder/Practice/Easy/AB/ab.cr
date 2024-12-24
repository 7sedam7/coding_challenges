# https://arena.topcoder.com/#/u/practiceCode/16319/46378/13642/1/325040
# You are given two integers: N and K. Lun the dog is interested in strings that satisfy the following conditions:
#   - The string has exactly N characters, each of which is either A or B.
#   - The string s has exactly K pairs (i, j) (0 <= i < j <= N-1) such that s[i] = A and s[j] = B.
# 
# If there exists a string that satisfies the conditions, find and return any such string. Otherwise, return an empty string.

class AB
  private def find_number_of_as(n : Int32, k : Int32) : Int32
    m = n / 2
    (1..m).each do |i|
      return i if (i * (n-i) >= k)
    end
    -1
  end

  def create_string(n : Int32, k : Int32) : String
    a_count = find_number_of_as(n, k)
    return "" if a_count == -1

    k_ = a_count * (n - a_count)
    last_a_move = 0
    if k_ > k
      last_a_move = k_ - k
      a_count -= 1
    end

    if last_a_move != 0
      return "A"*a_count + "B"*last_a_move + "A" + "B"*(n - a_count - last_a_move - 1)
    end
    return "A"*a_count + "B"*(n - a_count)
  end
end

n = 49
ab = AB.new

(2..n).each do |i|
  m = i*(i-1)/2 - 1
  (0..m).each do |j|
    puts "#{i},#{j},#{ab.create_string(i,j)}"
  end
end
