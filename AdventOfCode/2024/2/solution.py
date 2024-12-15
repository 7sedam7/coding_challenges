import sys

left_occurances = {}
right_occurances = {}

for line in sys.stdin:
    line = line.rstrip()
    if line == '':
        break

    a, b = line.split()
    a = int(a)
    b = int(b)

    if a in left_occurances:
        left_occurances[a] += 1
    else:
        left_occurances[a] = 1

    if b in right_occurances:
        right_occurances[b] += 1
    else:
        right_occurances[b] = 1

similarity_score = 0

for val in left_occurances:
    if val in right_occurances:
        similarity_score += left_occurances[val] * val * right_occurances[val]

print(similarity_score)
