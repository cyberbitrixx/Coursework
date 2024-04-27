# 🍋 Little Lemon
## Description
<img align="right" src="https://github.com/cyberbitrixx/Coursework/blob/4834e354ff659e957d41bb3491af9fb19a0fbfc5/assets/2-modified.png">

Little Lemon is an iOS app developed as a final project for the "Working With Data in iOS" course by Meta on Coursera. The app serves as a menu platform for the Little Lemon restaurant, allowing users to browse available dishes, filter them by name, and place orders.
 <br><br>
  <br><br>
   <br><br>



## Course Information

1. [Course link](https://www.coursera.org/learn/working-with-data-in-ios) on Coursera.
2. My [certificate](https://github.com/cyberbitrixx/Coursework/blob/4834e354ff659e957d41bb3491af9fb19a0fbfc5/certificates/Coursera-Working-With-Data-in-iOS.pdf).
   <br><br>
 <br><br>


## Assignment Requirements | Behaviours
The primary objective was to demonstrate the ability to retrieve data from a web server using REST APIs, decode JSON data into Swift models, and perform sorting and filtering operations to display the retrieved data in an organized manner.
   <br><br>

| Requirement  | Description |
| ------------- | ------------- |
| Location Selection  | Implement a feature that allows users to select their preferred restaurant branch location  |
| Menu Display  | Fetch and display a list of available dishes from the server based on the selected location  |
| Search and Filtering  | Incorporate a search functionality that enables users to filter the dish list by name  |
| Order Placement  | Provide a mechanism for users to place orders by tapping on individual dish items in the list  |
| Navigation  | Implement a tab-based navigation structure with three main tabs: "Locations," "Our Dishes," and "Reservations"  |
| Data Handling  | Retrieve menu data from a provided web server, decode the JSON response into Swift models, and handle potential errors or edge cases  |

 <br><br>

**Fun fact:** I was the only one among my peers who successfully implemented the app's functionality as per the assignment requirements. What's even funnier - the course's solution code doesn't work either, so in order to fulfill the assignment’s requirements I had to restructure the app according to MVVM design pattern and fix the bug with displaying menu data.
 <br><br>
 <br><br>

## Course Solution vs My Solution
[Link](https://github.com/cyberbitrixx/Coursework/tree/5161899780e05272ccc2aac75f52d9e4034321d2/Little-Lemon-Solution-By-Meta) to download the solution project provided by Meta and run on your device.
 <br><br>

### Meta Solution:
Data is not displayed and solution doesn't fulfill the assignment requirements
![](https://github.com/cyberbitrixx/Coursework/blob/863bd82396c9d18f1f4ee560e2a4adedadc04889/assets/Screenshot%202024-04-26%20at%206.30.46%20PM.png)
 <br><br>

 ### My Solution:
 - All the requirements are met
 - Data display bug is fixed and data is being requested, decoded and displayed properly
 - Implemented menu filtering, sorting and searching
   
 | Browse Dishes | Dish Ordered | Search Dish |
| :---:         |     :---:      |          :---: |
| ![](https://github.com/cyberbitrixx/Coursework/blob/dfc578d2981ff22fa2a08b8f9316b2c7ab3f09cb/assets/Screenshot%202024-04-26%20at%206.33.30%20PM.png)   | ![](https://github.com/cyberbitrixx/Coursework/blob/dfc578d2981ff22fa2a08b8f9316b2c7ab3f09cb/assets/Screenshot%202024-04-26%20at%206.33.39%20PM.png)     | ![](https://github.com/cyberbitrixx/Coursework/blob/dfc578d2981ff22fa2a08b8f9316b2c7ab3f09cb/assets/Screenshot%202024-04-26%20at%206.34.04%20PM.png)    |

 <br><br>
**Note:** This table doesn't provide the preview for the rest of app's functionality but only menu data part. To see the whole functionality of the app:
1. Download the zip file of this project to your local device.
2. Open the project in X Code.
3. Run the app on simulator and check what else does it have to show :)
 <br><br>


## Technologies used
* Swift
* SwiftUI
* Core Data
* JSON
* RESTful API
* MVVM

 <br><br>

By: Sofia Shchukina, August 2023
