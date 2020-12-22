import regex

const (
	inputs = [
		'departure location: 43-237 or 251-961',
		'departure station: 27-579 or 586-953',
		'departure platform: 31-587 or 608-967',
		'departure track: 26-773 or 784-973',
		'departure date: 41-532 or 552-956',
		'departure time: 33-322 or 333-972',
		'arrival location: 30-165 or 178-965',
		'arrival station: 31-565 or 571-968',
		'arrival platform: 36-453 or 473-963',
		'arrival track: 35-912 or 924-951',
		'class: 39-376 or 396-968',
		'duration: 31-686 or 697-974',
		'price: 28-78 or 96-971',
		'route: 32-929 or 943-955',
		'row: 40-885 or 896-968',
		'seat: 26-744 or 765-967',
		'train: 46-721 or 741-969',
		'type: 30-626 or 641-965',
		'wagon: 48-488 or 513-971',
		'zone: 34-354 or 361-973',
		'departure location: 43-237 or 251-961',
		'departure station: 27-579 or 586-953',
		'departure platform: 31-587 or 608-967',
		'departure track: 26-773 or 784-973',
		'departure date: 41-532 or 552-956',
		'departure time: 33-322 or 333-972',
		'arrival location: 30-165 or 178-965',
		'arrival station: 31-565 or 571-968',
		'arrival platform: 36-453 or 473-963',
		'arrival track: 35-912 or 924-951',
		'class: 39-376 or 396-968',
		'duration: 31-686 or 697-974',
		'price: 28-78 or 96-971',
		'route: 32-929 or 943-955',
		'row: 40-885 or 896-968',
		'seat: 26-744 or 765-967',
		'train: 46-721 or 741-969',
		'type: 30-626 or 641-965',
		'wagon: 48-488 or 513-971',
		'zone: 34-354 or 361-973',
		'departure location: 43-237 or 251-961',
		'departure station: 27-579 or 586-953',
		'departure platform: 31-587 or 608-967',
		'departure track: 26-773 or 784-973',
		'departure date: 41-532 or 552-956',
		'departure time: 33-322 or 333-972',
		'arrival location: 30-165 or 178-965',
		'arrival station: 31-565 or 571-968',
		'arrival platform: 36-453 or 473-963',
		'arrival track: 35-912 or 924-951',
		'class: 39-376 or 396-968',
		'duration: 31-686 or 697-974',
		'price: 28-78 or 96-971',
		'route: 32-929 or 943-955',
		'row: 40-885 or 896-968',
		'seat: 26-744 or 765-967',
		'train: 46-721 or 741-969',
		'type: 30-626 or 641-965',
		'wagon: 48-488 or 513-971',
		'zone: 34-354 or 361-973',
		'departure location: 43-237 or 251-961',
		'departure station: 27-579 or 586-953',
		'departure platform: 31-587 or 608-967',
		'departure track: 26-773 or 784-973',
		'departure date: 41-532 or 552-956',
		'departure time: 33-322 or 333-972',
		'arrival location: 30-165 or 178-965',
		'arrival station: 31-565 or 571-968',
		'arrival platform: 36-453 or 473-963',
		'arrival track: 35-912 or 924-951',
		'class: 39-376 or 396-968',
		'duration: 31-686 or 697-974',
		'price: 28-78 or 96-971',
		'route: 32-929 or 943-955',
		'row: 40-885 or 896-968',
		'seat: 26-744 or 765-967',
		'train: 46-721 or 741-969',
		'type: 30-626 or 641-965',
		'wagon: 48-488 or 513-971',
		'zone: 34-354 or 361-973',
		'departure location: 43-237 or 251-961',
		'departure station: 27-579 or 586-953',
		'departure platform: 31-587 or 608-967',
		'departure track: 26-773 or 784-973',
		'departure date: 41-532 or 552-956',
		'departure time: 33-322 or 333-972',
		'arrival location: 30-165 or 178-965',
		'arrival station: 31-565 or 571-968',
		'arrival platform: 36-453 or 473-963',
		'arrival track: 35-912 or 924-951',
		'class: 39-376 or 396-968',
		'duration: 31-686 or 697-974',
		'price: 28-78 or 96-971',
		'route: 32-929 or 943-955',
		'row: 40-885 or 896-968',
		'seat: 26-744 or 765-967',
		'train: 46-721 or 741-969',
		'type: 30-626 or 641-965',
		'wagon: 48-488 or 513-971',
		'zone: 34-354 or 361-973',
	]
)

fn main() {
	pattern := r'\d+'
	mut re := regex.regex_opt(pattern) or { panic(err) }
	mut total := u64(0)
	for _ in 0 .. 100000 {
		for input in inputs {
			idxs := re.find_all(input)
			for i := 0; i < idxs.len; i += 2 {
				total += input[idxs[i]..idxs[i + 1]].u64()
			}
		}
	}
	println(total)
	// println('$input => idxs:$idxs') // idxs:[0, 1]
}
// 21159000000
// 65K Dec 22 08:12 regex_digit

// Current V version:
// V 0.1.30 b47daad, timestamp: 2020-12-22 08:32:32 +0100
// ./regex_digit  20.68s user 0.91s system 99% cpu 21.759 total
// ./regex_digit  20.35s user 0.82s system 99% cpu 21.195 total