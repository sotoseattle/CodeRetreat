CODE RETREAT
============

An exercise to apply what I learned this Saturday in the Global day of Code Retreat 2014.

I am trying to code the Game Of Life following the principles of simple design, and I recording the results and my reflections on the process for my own sake. (Sad way to spend a weekend? maybe, though so far so good.)

### Learning to Fly

First and foremost I am not only starting every iteration writing the tests, but trying to write them from the most general point of view, avoiding referring to implementation details. This is extremely difficult for two reasons:

1. Unconsciously I ask a testing question / requirement already having an implicit idea of how to answer it. Visualizing how things should work, even if only in the end point (as seen by customer or objects), does not happen in a vacuum. As soon as one starts to think about it, the mind starts to consider alternatives: data structures, algorithms, etc, from past experience. I want to keep the questions as open-ended as possible, so later on the code can answer as it sees fit, from the trenches in the battlefield and not directed by an armchair admiral.
2. If the testing question / requirement is too general, too abstract, too high altitude, it ends up encompassing way too much functionality, which requires to implement too many things in too many places in order to pass the test. Therefore I need to get down from the high chair and make more concrete, low level requirements. But this in turn, (i.e. calling a specific intermediary method in my test) is already steering and making me think of concrete implementation details!

There is great tension between these forces, between flying high without getting lost in space, and flying low and hitting the rooftops.

### Gravity pull

Another difficulty I have seen. By passing tests and only passing them, without regard for the overall design from the get go, I tend to find myself thinking in a tunnel, with a narrow scope of the problem (pass the test). Like doing white-board challenges, way too close to what I am writing in the white-board, unable to see and play with the whole picture.

This narrowing is like a gravitational pull. Happens without being aware. The way to solve it is through the refactoring phase. Then I step back, or fly to high altitude again to look at the code in its entirety, check how the pieces work together, and try to give them a more consistent and natural feel.

### Writing Test Miss-conception

Initially I though that the tests were going to be written in stone, once written they would remain essentially the same (not considering small refactorings to input/output as we add features). I was wrong. I have found myself refactoring tests as much as code. What I though should belong to Cell ended up in a Location object, and that forces the test itself to change places. Tests were written, deleted, moved, and refactored continuously. Tests become Code.

### Emergence?

My biggest pleasure in this exercise, and what I wanted to evaluate in the first place, was the ability of the process to allow good code to emerge.

I started only considering living cells that live and die because of the proximity of other cells. The ley being that I did not consider locations where new cells would emerge. Through the iterations I ended extracting the Location from the Cell, so the cell attends only to its biological imperatives and the location encapsulates all the geographical functionality (coordinates). This allowed to have a minimal controller of the game that only keeps track of living cells. Later on I added a new class, a Chart that can visualize a group of locations, the locations of the living cells.

Now, for the fun part. Given this code, the result of the aforementioned process. Where I have taken good care to keep things encapsulated, apart, to each his own according to his responsibilities and capabilities. How hard will it be to add the functionality of certain locations becoming populated by new cells due to proximity of other living cells?

### Close, but no cigar!

Well, no. It didn't save me the pain of a big refactoring.

Once I had to consider spawning locations the whole design fell to pieces. I was tracking living cells and the Cell class had responsibility over knowing its neighbors. Now that I needed to find a way to encompass both, tracking already living cells and looking for fertile locations where new cells could come to life, I saw that keeping track of and analyzing locations could achieve the both things better.

I could see 3 ways to go about it:

1. Topographically, we only consider locations, like a field potential where alive is 100%, dead is 0%, and spawning is in-between.
2. Biologically, with a graph made of cells, which I traverse to decide if I create new ones.
3. Topo for spawning locations and bio for living cells. May make the most natural sense, since spawning locations and living cells are different things, but I cannot see that is worth the extra level of complexity. A more complex setting could make me choose this route.

This high level understanding of the design could have been taken head-on from the start, saving me the extra miles walked down the cell path, to only retrace and re-code as location based.

At the same time, this process allowed me to never get stuck because of the complexity of the problem. You always advance, even if it means taking 2 steps forward and one back. If time is not a constraint this way feels natural and it flows.

Another benefit is that you can always relay on the test previously written. This is an immense aid and a boost to the confidence that the new route (big refactoring) works.

A final benefit is that the continuous refactoring to make its language more natural, makes you end up with a minimized code and a deep understanding of what everything does.

### Disclaimer

This work is left unfinished. The chart class, which visualizes the board, is a bit messy and could benefit from refactoring (maybe set inside World?).

More tests are needed. I still need to work on really covering all possible scenarios for each class. I started strong but I have the feeling that I dropped the ball a bit by the end.

Other refactorings are possible and I may come back to it later on to perfect it, or to even add new features as per the Code Retreat mods and ideas.

## Author

- Javier Soto

## License

The MIT License

Copyright (c) 2014 Javier Soto

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
