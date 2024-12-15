import sys

left = []
right = []

for line in sys.stdin:
    line = line.rstrip()
    if line == '':
        break

    a, b = line.split()
    left.append(int(a))
    right.append(int(b))

left.sort()
right.sort()

total_diff = 0

for (a, b) in zip(left, right):
    total_diff += abs(a - b)

print(total_diff)
