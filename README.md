
![Logo](https://github.com/bagheriamin/PocketRehab/blob/main/POCKET%20REHAB.png?raw=true)


# PocketRehab

A revolutionary app which brings together injury prevention and injury recovery, and puts it right in the palm of the user.
## Technologies Used

**Tech Stack:** 
SwiftUI, Cloud Firestore, Firebase Authentication, REST API, RegEx / Regular Expressions, Cocoapods, UserDefaults, Image Caching

**Architecture:**
MVVM

**Swift:** PhotosUI, AVPlayer, AVPlayer, AVFoundation, MFMailComposeViewController, PHPickerViewController, NotificationCenter, Accessability Tools, UIViewRepresentable, Geometry Reader
## PocketRehab Demo
![Alt Text](https://github.com/bagheriamin/PocketRehab/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2011%20-%202022-08-18%20at%2011.30.31.gif?raw=true)



## Inspirational Quote API Request

#### To pull the inspirational quotes in the home screen:

```http
  GET https://api.api-ninjas.com/v1/quotes?category=inspirational
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `X-Api-Key` | `string` | **Required**. The API key. (Used in HTTP Header) |


#### Returned JSON from Quotes API
```
[
  {
    "quote": "The will of man is his happiness.",
    "author": "Friedrich Schiller",
    "category": "happiness"
  }
]
```

#### Quote API Model
![](https://github.com/bagheriamin/PocketRehab/blob/main/carbon-15.png?raw=true)


## User Authentication

To authenticate users in my app, I opted to go for Firestore Auth, as it is one, free, which for an independant app developer is always a plus, and two, it is highly scalable, so my app will be handled properly no matter the user count.

*I purposefully put incorrect data to showcase login/register errors. The login IS NOT BROKEN! 😂*
![](https://github.com/bagheriamin/PocketRehab/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2011%20-%202022-08-18%20at%2011.52.45.gif?raw=true)

To verify that users emails and passwords were implemented in the correct format, I went ahead and used RegEx, or RegularExpressions to complete the validation process. Here is an example of the password RegEx, as well as the function to make sure the two passwords are the same.

![](https://github.com/bagheriamin/PocketRehab/blob/main/carbon-16.png?raw=true)

## Implementing User Image Cache Feature

To keep the app running as fast as possible, if we had to load the uimage from Firestore every time it loaded in the view, it would not only be unneccassary API calls, but it would also make loading the home screen much slower. To combat this, I followed a three step process.

**Step One**

First, I used this function to turn the Image that the user submitted into data for saving.
![](https://github.com/bagheriamin/PocketRehab/blob/main/carbon-18.png?raw=true)

**Step Two**


Then, I simply save this data to UserDefaults, and use that data to load the profile photo, instead of sending a call all the way to firestore.
![](https://github.com/bagheriamin/PocketRehab/blob/main/carbon-19.png?raw=true)

**Step Three**

Now that the image data is cached onto the device, I call this function whenever the home screen appears, and set the profile photo!
![](https://github.com/bagheriamin/PocketRehab/blob/main/carbon-21.png?raw=true)

## Implementing the 'Pain Map' feature

The Pain Map feature was one that required some mathematical skills, especially when it come to coordinates, ratios and equalities. 

However, once I got it to work, it really was a joy playing around with the dummy model and selecting different body parts.

**Pain Map Demo**

![](https://github.com/bagheriamin/PocketRehab/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2011%20-%202022-08-18%20at%2012.27.40.gif?raw=true)


**Pain Map Step One**

First, I embeded the Pain Map Image inside of a Geometry Reader, as it allows me to get access to the coordinates of the bounds of the Image.

**Pain Map Step Two**

Secondly, I went and created ratios for each body part. To not confuse you, I will explain with this diagram. 

Lets say that the **Dummy Image Height and Width** (total image bounds) is ***300 width, 500 height***.

Then, lets say that the top left coordinate for the **Knee Hitbox** is ***(50, 350)*** and the bottom right coordinate for the **Knee Hitbox** is ***(250, 400)***

Now, I have the full bounds of the image, and the full bounds of the knee hitbox. I can now create ratios that represent where the **knee hitbox** lies in respect to the bounds of the **dummy image**.

![](https://github.com/bagheriamin/PocketRehab/blob/main/IMG_0527.jpg?raw=true)

So, let's break this down. 

To get the Y ratios, I need the ***two Y coordinates of the knee hitbox***, which were **350** and **400**. Now, I take the ***height of the dummy image*** which was **500**. 

So, to get the Y ratios: 

* I did 350 / 500, which is 0.7
* I did 400 / 500, which is 0.8

To get the X Ratios, I did the exact same thing, except with the **X coordinates of the knee hitbox** and **the width of the dummy image.**

* I did 50 / 300, which is 0.16
* I did 250 / 300, which is 0.83

Finally, I did that with every single body part. Body parts like the wrists or elbows had to be two different hit boxes, as they are so far apart that they would obstruct other body part hitboxes.

The reason why I went with ratios and not exact values is scalability! A ratio is a ratio, no matter the device. Hardcoded values however would differ between devices.

Before we move onto the final step of this implementation, let me just show a quick example of some of the ratios in my actual app:
![](https://github.com/bagheriamin/PocketRehab/blob/main/carbon-22.png?raw=true)

**Pain Map Step Three**

So, the final step. Now that we have all the different ratios mapped out across the pain map, we can now easily figue out whether a user made a tap on a body part or not.

I added a *tap gesture* to the dummy image, and so whenever the image is tapped, I get it's coordinates like so:
![](https://github.com/bagheriamin/PocketRehab/blob/main/carbon-24.png?raw=true)

Once I have the coordinates, it's as simple as checking whether or not those coordinates, when turned into ratios themselves, fit within the range of the hard-coded coordinates we made earlier.

This is done with a series of checks, such as checking if the knee was tapped. If not, I check if the ankles were tapped, if not, I check if the low back, and so on and so forth. If nothing was tapped, I reset the dummy back to it's original state. 

However, if something was tapped, I go to show an image of the dummy with the body part that was highlighted.

Here is an example of the check for the lower back:
![](https://github.com/bagheriamin/PocketRehab/blob/main/carbon-25.png?raw=true)

And that's pretty much it! Pain map implementation is done!

## Installation

Download the project via Code > Download as ZIP

If the SDWebImage package has not downloaded properly, here is the link to install it in the Swift Package Manager as a third-party dependency:
https://github.com/SDWebImage/SDWebImage.git
