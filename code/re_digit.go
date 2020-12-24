package main

import (
	"fmt"
	"regexp"
	"strconv"
)

var inputs = []string{"departure location: 43-237 or 251-961",
	"departure station: 27-579 or 586-953",
	"departure platform: 31-587 or 608-967",
	"departure track: 26-773 or 784-973",
	"departure date: 41-532 or 552-956",
	"departure time: 33-322 or 333-972",
	"arrival location: 30-165 or 178-965",
	"arrival station: 31-565 or 571-968",
	"arrival platform: 36-453 or 473-963",
	"arrival track: 35-912 or 924-951",
	"class: 39-376 or 396-968",
	"duration: 31-686 or 697-974",
	"price: 28-78 or 96-971",
	"route: 32-929 or 943-955",
	"row: 40-885 or 896-968",
	"seat: 26-744 or 765-967",
	"train: 46-721 or 741-969",
	"type: 30-626 or 641-965",
	"wagon: 48-488 or 513-971",
	"zone: 34-354 or 361-973",
	"departure location: 43-237 or 251-961",
	"departure station: 27-579 or 586-953",
	"departure platform: 31-587 or 608-967",
	"departure track: 26-773 or 784-973",
	"departure date: 41-532 or 552-956",
	"departure time: 33-322 or 333-972",
	"arrival location: 30-165 or 178-965",
	"arrival station: 31-565 or 571-968",
	"arrival platform: 36-453 or 473-963",
	"arrival track: 35-912 or 924-951",
	"class: 39-376 or 396-968",
	"duration: 31-686 or 697-974",
	"price: 28-78 or 96-971",
	"route: 32-929 or 943-955",
	"row: 40-885 or 896-968",
	"seat: 26-744 or 765-967",
	"train: 46-721 or 741-969",
	"type: 30-626 or 641-965",
	"wagon: 48-488 or 513-971",
	"zone: 34-354 or 361-973",
	"departure location: 43-237 or 251-961",
	"departure station: 27-579 or 586-953",
	"departure platform: 31-587 or 608-967",
	"departure track: 26-773 or 784-973",
	"departure date: 41-532 or 552-956",
	"departure time: 33-322 or 333-972",
	"arrival location: 30-165 or 178-965",
	"arrival station: 31-565 or 571-968",
	"arrival platform: 36-453 or 473-963",
	"arrival track: 35-912 or 924-951",
	"class: 39-376 or 396-968",
	"duration: 31-686 or 697-974",
	"price: 28-78 or 96-971",
	"route: 32-929 or 943-955",
	"row: 40-885 or 896-968",
	"seat: 26-744 or 765-967",
	"train: 46-721 or 741-969",
	"type: 30-626 or 641-965",
	"wagon: 48-488 or 513-971",
	"zone: 34-354 or 361-973",
	"departure location: 43-237 or 251-961",
	"departure station: 27-579 or 586-953",
	"departure platform: 31-587 or 608-967",
	"departure track: 26-773 or 784-973",
	"departure date: 41-532 or 552-956",
	"departure time: 33-322 or 333-972",
	"arrival location: 30-165 or 178-965",
	"arrival station: 31-565 or 571-968",
	"arrival platform: 36-453 or 473-963",
	"arrival track: 35-912 or 924-951",
	"class: 39-376 or 396-968",
	"duration: 31-686 or 697-974",
	"price: 28-78 or 96-971",
	"route: 32-929 or 943-955",
	"row: 40-885 or 896-968",
	"seat: 26-744 or 765-967",
	"train: 46-721 or 741-969",
	"type: 30-626 or 641-965",
	"wagon: 48-488 or 513-971",
	"zone: 34-354 or 361-973",
	"departure location: 43-237 or 251-961",
	"departure station: 27-579 or 586-953",
	"departure platform: 31-587 or 608-967",
	"departure track: 26-773 or 784-973",
	"departure date: 41-532 or 552-956",
	"departure time: 33-322 or 333-972",
	"arrival location: 30-165 or 178-965",
	"arrival station: 31-565 or 571-968",
	"arrival platform: 36-453 or 473-963",
	"arrival track: 35-912 or 924-951",
	"class: 39-376 or 396-968",
	"duration: 31-686 or 697-974",
	"price: 28-78 or 96-971",
	"route: 32-929 or 943-955",
	"row: 40-885 or 896-968",
	"seat: 26-744 or 765-967",
	"train: 46-721 or 741-969",
	"type: 30-626 or 641-965",
	"wagon: 48-488 or 513-971",
	"zone: 34-354 or 361-973",
}

func main() {
	re := regexp.MustCompile(`\d+`)
	total := uint64(0)
	for i := 0; i < 100000; i++ {

		for _, str := range inputs {
			values := re.FindAllString(str, -1)
			for _, s := range values {
				v, _ := strconv.ParseUint(s, 10, 64)
				total += v
			}
		}
	}
	fmt.Println(total) // [43 237 251 961]
}
//211590000