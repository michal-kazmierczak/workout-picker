# workout-picker

A simple knapsack problem solver build in a context of picking the right workout exercises. See `sample_input.json` for expected input.

## Running 
```bash
docker build . -t workout-picker:1.0.0 && docker run -p 4567:4567 workout-picker:1.0.0
```
once running, you can test it by executing:
```bash
❯ curl -d @sample_input.json -X POST localhost:4567
[155,[{"id":"404c1873-96e5-4767-899a-c28697b4ccd4","name":"Squats","average_span":20,"average_calorie_consumption":120},{"id":"81fd3a46-e736-4498-9094-f5d7730d1409","name":"Jumping jacks","average_span":10,"average_calorie_consumption":35}]]
```

## Testing
```bash
bundle exec rspec
```
