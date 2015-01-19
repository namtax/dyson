#Dyson

Dyson is an automated robo-hoover, feed it instructions and let it go to work. On completion, Dyson will produce a report which includes: 

- The final hoover position (X, Y)
- The number of patches of dirt the robot cleaned up

###Example
```
sh$ bin/dyson
1 3  
1   
```

###Installation

Clone repository.

```
git clone git@github.com:namtax/dyson.git
```
Create program input using the example file.
```
mv dyson/bin/input.txt.example dyson/bin/input.txt
```
Update the file to your liking.
Example: 
```
5 5 
1 2
1 0
2 2
2 3
NNESEESWNWW
```

- The first line holds the room dimensions (X Y), separated by a single space (all coordinates will be presented in this format)
- The second line holds the hoover position
- Subsequent lines contain the zero or more positions of patches of dirt (one per line)
- The final line then always contains the driving instructions (at least one)

###Usage
Run the following command from Dyson root. 

```
cd dyson
bin/dyson
```

If stuck - ask for help.

```
bin/dyson --help
```

###You made it to the end of the Readme
Have a cookie!