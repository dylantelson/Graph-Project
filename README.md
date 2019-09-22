# Graph-Project


For this project, I decided to make a graph that visualizes the stock market of the past month for 9 different companies (Netflix, Apple, Facebook, Microsoft, NASDAQ, Citigroup, Cisco, Uber, and AMD). The graph gets the information from an API on iexcloud.io, then visualizes it on a custom UIView named Line. There is a legend that shows what color each stock represents, and it is ordered so the stock that starts with the highest valuation appears first. Line graphs are very commonly used to represent stock valuations, so I decided to use that. I wanted to use an API as that was one of my favorite things to do as a web developer, so I opted for that and found IEXCloud. I used a 2D Array of floats for the data: first I have an array that holds each line array, which then holds the stock values for each day of the past month for that company. I also used structs for the stock data, the company names, and the colors, so I could use them throughout different classes easily. For example, Points.myPoints[0][0] would hold the 1st day value for the highest valued stock, and Points.myPoints[3][10] would hold the 11th day value for the 4th highest valued stock. I also have text that says "Loading..." while the graph loads the stock data, and deletes the UILabel when the graph is visualized.

I used help from:

https://medium.com/@tstenerson/lets-make-a-line-chart-in-swift-3-5e819e6c1a00 Learning how to draw lines (ended up not using this tutorial's help, as it wasn't working)
https://www.youtube.com/watch?v=9sJxtzTo8W0 To learn how to draw lines in Swift
https://www.youtube.com/watch?v=9iazQQdNoNU To learn how to parse JSON from a website
https://developer.apple.com/documentation/uikit/uicolor For colors
https://stackoverflow.com/questions/27037839/force-landscape-mode-in-one-viewcontroller-using-swift Forcing landscape mode
https://developer.apple.com/documentation/swift/2885649-abs Absolute value
https://www.zerotoappstore.com/how-to-set-background-color-in-swift.html Background color
https://flatuicolors.com/palette/defo Used this to find good colors for the graph
https://www.appcoda.com/bezier-paths-introduction/ Used this to learn how to draw circles
https://www.codzify.com/swiftIOS/swift_UILabel Used this to learn how to add UILabels programmatically
https://iexcloud.io/ This is the API I used to get the stock data
https://stackoverflow.com/questions/31090983/how-do-i-change-the-font-of-a-uilabel-in-swift-without-changing-the-font-size This helped me change the font programmatically for the loading text
https://stackoverflow.com/questions/50033226/swift-4-sorting-multidimensional-array I used this to learn how to sort a 2DArray

Most of the work of the project was making the API work, then figure out how to make the design look good (design is one of my weaknesses). I learned a lot about XCode and Swift through this project, as before I had only followed a few tutorials in my spare time and never really programmed my own app. It also strengthened my grasp on a few concepts, such as 2DArrays, JSON parsing, Swift's UIBezierPath(), and the way classes work in XCode. I still haven't figured out how to make it work well on multiple devices, so it is optimized for the iPhone XR and objects will look out of place on different devices.

Timeline:
On September 9th, I started learning how to draw lines, but failed to make it work as the tutorial I had found was outdated (Swift 3).
On September 13th, I started again and managed to draw lines based on the values within an array. I also started coding the JSON parsing and found iexcloud.io, but did not manage to make it work.
On September 14th, I managed to get the JSON parsing working, but had issues making the draw function run as it only ran before the API information was acquired.
On September 17th, I got the drawing based on the API data working, but only for one stock. Adding more stocks caused the program to crash.
On September 19th, I solved the issues (was not leaving enough time for every JSON to be parsed before trying to get the data) and the Stock API was working with 8 stocks and visualizing them with distinct colors.
On September 20th, I added the legend, a background color, and added circles to every new point in a line. I also added some text, and changed some stocks. At this point most of the core work was done, and the main work left was making it look good.
On September 22nd, I completely changed the design of the app, changing the fonts, colors used for background and lines, removed the border on the circles in the legend, and sorted the graphs so the colors and legend order are the same every time rather than based on when the respective API data is parsed. I also added the Netflix stock, removed the Legend text, added the Y markings for the graph, and changed the size and location of the graph and legend.