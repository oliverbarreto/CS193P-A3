CS193P-A3.V1.0 - Initial Commit
	- Created the Project Structure: Window Based App
	- Imported CalculatorBrain, Axes
	- Created: 
		- Main Navigation Bar Controller in AppDelegate:
		- CalculatorViewController as the first Controller in the App
		- A new GraphViewController to manage the graph view of the current expression in the 			CalculatorViewController
		- The XIB file contains a ZoomIn and a ZoomOut buttons, also displays a Label to present the user the current state of the scale property 

Completed:
- Required:

- Extra Credit:
 
- Known Bugs:



Assignment 3:

Required Tasks

1. Create an application that, when launched, presents the user-interface of your calculator from Assignment 2 inside a UINavigationController.2. The only variable button your calculator user-interface should present is x.3. Add a button to your calculator’s user-interface that, when pressed, pushes a UIViewController subclass onto the UINavigationController’s stack which brings up a view that contains a custom view which is a graph of whatever expression was in the calculator when the button was pressed. The y axis should be the evaluation of the expression at multiple points along the x axis (each of which is substituted for the x variable). Pick a reasonable scale for your graph to start with.
4. In addition to the custom view to draw the graph, the view that appears should also have two buttons, “Zoom In” and “Zoom Out” which increase or decrease the scale of the graph by a reasonable amount.
5. Your graphing view must display the axes of the graph in addition to the plot of the expression. Code will be provided on the class website which will draw axes with an origin at a given point and with a given scale, so you will not have to write the Core Graphics code for drawing the axes, only for the graphing of the expression itself. You probably will want to check this out to understand how the scaling works before you do #3 and #4 above.
6. Your graphing view must be generic and reusable. For example, there’s no reason for your graphing view class to know anything about a CalculatorBrain or an expression. Use a protocol to get the graphing view’s data because Views should not own their data.
7. Make your user-interface as clean as possible. For example (only an example), use some colors on the button titles to group them together visually. Set the titles of both UIViewControllers that appear on the UINavigationController’ s stack to something reasonable. Make sure your layout is balanced and aesthetically pleasing. Consider the user’s experience when touching buttons (e.g. when the user touches the Graph button, you should probably automatically confirm any partially entered number as the operand and even do a performOperation:@“=” on behalf of the user). The calculator UI this week now matters: it’s not just a testing UI for the CalculatorBrain like it was last week.


Extra Credit Tasks

1. In the Hints section it is noted that you are allowed to draw your graph by drawing a line from each point to the next point. Clearly if your function were discontinuous (e.g. 1/x) or if you had zoomed out so far that drawing a line between points would be jumping over a lot of changes in y, this would give misleading results to the user. The best thing would probably be to simply draw dots at each coordinate you calculate. This would not help much with the zoomed-out-too-far problem, but it would certainly be more accurate on discontinuous functions. It is up to you to figure out how to draw a dot at a point with Core Graphics.
2. If you do Extra Credit #1, you’ll notice that some functions (like sin(x)) look so much nicer using the “line to” strategy (at least when zoomed in appropriately). Try adding a UISwitch to your user-interface which lets the user switch back and forth between “dot mode” and “line to” mode drawing.
3. Clean up the descriptionOfExpression: output. This is an exercise in anticipating all the possible expression combinations and also an exercise in using the NSStringclass. Think about not only converting the expression x sin to sin(x), but even tricky memory operations, e.g., turn 3 * x * x = Mem+ 4 * x = Mem+ 5 Mem+ into 3*x*x + 4*x + 5.4. See if you can make one or both of your UIViewControllers work when the device is rotated. You need to implement shouldAutorotateToInterfaceOrientation: to return YES more often than it does by default and you will need to get your springs and struts in Interface Builder set up properly so that views stretch in the right directions and stick to the edges of the view they are supposed to. This is pretty straightforward for your “graph and zoom buttons” view, but quite a bit more of a challenge (nigh on impossible!) for your calculator keypad view.
