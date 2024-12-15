package main

import (
	"fmt"
	"math"
	"slices"
)

func main() {
	var a, b int
	var left, right []int

	for {
		n, _ := fmt.Scanf("%d %d\n", &a, &b)
		if n == 0 {
			break
		}

		left = append(left, a)
		right = append(right, b)
	}

	slices.Sort(left)
	slices.Sort(right)

	total_diff := 0

	for i := range left {
		total_diff += int(math.Abs(float64(left[i] - right[i])))
	}

	fmt.Println(total_diff)

	// fmt.Printf("%v", left)
	// fmt.Printf("%v", right)
}
