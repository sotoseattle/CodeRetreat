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

### Emergence

My biggest pleasure in this exercise, and what I wanted to evaluate in the first place, was the ability of the process to allow good code to emerge.

I started only considering living cells that live and die because of the proximity of other cells. The ley being that I did not consider locations where new cells would emerge. Through the iterations I ended extracting the Location from the Cell, so the cell attends only to its biological imperatives and the location encapsulates all the geographical functionality (coordinates). This allowed to have a minimal controller of the game that only keeps track of living cells. Later on I added a new class, a Chart that can visualize a group of locations, the locations of the living cells.

Now, for the fun part. Given this code, the result of the aforementioned process. Where I have taken good care to keep things encapsulated, apart, to each his own according to his responsibilities and capabilities. How hard will it be to add the functionality of certain locations becoming populated by new cells due to proximity of other living cells?

(...)



