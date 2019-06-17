# Pizzabot

Pizzabot is bot for deliver pizzas in a given grid (where each point on the grid is one house). It will return a list of instructions of the path that the bot is passing to deliver the pizza to a certain point

The commands that will be returned are:

``` 
N: Move north 
S: Move south 
E: Move east 
W: Move west 
D: Drop pizza
```

## Requirement

Only Ruby is required to run the Pizzabot.

Check if you you already have
```bash
ruby -v
```
If not, then visit [
 https://www.ruby-lang.org/en/documentation/installation/](https://www.ruby-lang.org/en/documentation/installation/)

## Usage
From you terminal, navigate to the root folder of the project
```bash
$ cd myfolder/pizzabot
```
Then run 
```bash
ruby pizza-delivery.rb
```

It will show this input prompt
```bash
Enter the command for delivering in following pattern ex: '5x5 (2,3), (3,4), (0,1)' or press ENTER to run the default one
```
You can press `ENTER` or insert a command

## Example input
Just enter the following command, from which grid size is `5x5` and drop points are `(2,3)`, `(3,4)` and `(0,1)`. 

HINT: You can have more or less drop points, but it's required to have one grid size and and least one drop point.
```bash
"5x5 (2,3), (3,4), (0,1)"
```
## Example output
This is the example of the output which will be received
```bash
WWNNNDWNDEEESSSD
```

## Specs
To run the specs just run in the root folder of the project
```bash
rspec spec/
```

