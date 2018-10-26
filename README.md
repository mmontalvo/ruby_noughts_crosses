# Risk Ledger - Noughts & Crosses

Small Sinatra application written in Ruby

## Installation

If we already have `rvm` or a working version of Ruby, we just need to run:

```shell
bundle
```

Once we are done, we only need to run

```shell
ruby app.rb
```

This will start the Sinatra server, available at:

```
localhost:4567
```


Available routes are:

`GET /` to get the board printed (if it is the first time, will print an empty board)

`GET /reset` will set the board empty

`POST /` with JSON body in the following format `{"row": 1, "column": 1, "value": "x"}`


## Structure

In this app we have `app.rb` as the entry point of our API application, with a `board` and
`game` classes to deal with the logic to decide the winner or to know if we can continue playing
and the logic to print the board.