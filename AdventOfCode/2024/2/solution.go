package main

import (
	"fmt"
)

func main() {
	var a, b int
	left_occurance := make(map[int]int)
	right_occurance := make(map[int]int)

	for {
		n, _ := fmt.Scanf("%d %d\n", &a, &b)
		if n == 0 {
			break
		}

		if _, ok := left_occurance[a]; ok {
			left_occurance[a]++
		} else {
			left_occurance[a] = 1
		}

		if _, ok := right_occurance[b]; ok {
			right_occurance[b]++
		} else {
			right_occurance[b] = 1
		}
	}

	similarity_score := 0

	for val, times := range left_occurance {
		if amount, ok := right_occurance[val]; ok {
			similarity_score += times * val * amount
		}
	}

	fmt.Println(similarity_score)
}
