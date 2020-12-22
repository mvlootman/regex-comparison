# regex-comparison
extremely basic comparison of regex in different languages.
Performed the following regular expression `'\d+'` on 100 lines of text (each containing text and 4 numbers). This was repeated 100.000 times.
Each found number was summed up to receive a total of all the iterations, to validate result.
These result show elapsed time for just a single regular expression example, so please do not take the numbers as a benchmark of the different languages/options.

| option        | time   | version           | mem. bytes (max.resident set size)|mem. bytes(peak memory footprint)|bin.size|remarks|
|---------------|-------:|-------------------|------------------------------------:|----------------------------------:|------:|--------|
| PyPy          |  6.42s| 7.3.1 with GCC    |41.349.120|34.197.504|-||
| V (pcre)      |  7.66s| 0.1.30 (b16052d)  | 1.147.334.656|1.300.987.904|35KB|compiled with -prod|
| Crystal  |  8.77s| 0.35.1 (LLVM 9.0.1)  | 3.235.840|2.342.912|403KB|compiled with --release|
| Go            | 11.800s| 1.15.5            |10.051.584|7.196.672|2.4MB | |
| V (pcre) AF     |  14.08s| 0.1.30 (b16052d)  | 3.577.487.360|3.576.897.536|35KB|compiled with -prod -autofree|

| V (regex)     | 20.31s| 0.1.30 (b16052d)  | 3.170.934.784 |3.170.463.744|  65KB | compiled with -prod
| V (regex) AF  | 21.76s| 0.1.30 (b16052d)  |1.951.686.656 | 1.951.215.616| 65KB | compiled with -prod -autofree|
| Python        | 28.72s| 3.8.2             | 6.991.872 |- |..|               




## V (regex) code used
```V
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
}
// 21159000000
// ./regex_digit  20.68s user 0.91s system 99% cpu 21.759 total
```