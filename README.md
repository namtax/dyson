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

Clone this repository to a local directory.

```
git clone git@github.com:namtax/dyson.git
```
Store program input at Dyson/bin/input.txt - following the formatting rules. There is an example file located within the bin folder for reference. 

```
5 5 # All co-ords seperated by a single space
1 2
1 0
2 2
2 3
NNESEESWNWW # One or more directions (N|E|S|W)
```

###Usage
Run the following command from Dyson root. 

```
cd Dyson
bin/dyson
```

Ask for help if you encounter any problems with the input file.

```
bin/dyson --help
```

###You made it to the end of the Readme
Have a cookie!