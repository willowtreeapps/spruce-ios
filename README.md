![Spruce Logo](https://github.com/willowtreeapps/spruce-ios/raw/master/imgs/header_image.png)

# Spruce iOS Animation Library

[![CircleCI Build Status](https://circleci.com/gh/willowtreeapps/spruce-ios.svg?style=shield)](https://circleci.com/gh/willowtreeapps/spruce-ios)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-compatible-4BC51D.svg?style=flat)](https://github.com/CocoaPods/CocoaPods)
[![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)]()
[![Public Yes](https://img.shields.io/badge/Public-yes-green.svg?style=flat)]()

## What is it? 
Spruce is a lightweight animation library that helps choreograph the animations on the screen. With so many different animation libraries out there, developers need to make sure that each view is animating at the appropriate time. Spruce can help designers request complex multi-view animations and not have the developers cringe at the prototype. 

Here is a quick example of how you can Spruce up your screens!

![Example](https://github.com/willowtreeapps/spruce-ios/raw/master/imgs/extensibility-tests.gif)

## Installation Instructions
To make everything super easy, we currently support both CocoaPods and Carthage. If you want to just do everything yourself without a package manager, checkout our releases page and download the pre-built frameworks there or you can download the exact source from this Github project.

### CocoaPods
Add the following to your `Podfile`.

```
pod "Spruce", :git => "https://github.com/willowtreeapps/spruce-ios"
```

### Carthage
Add the following to your `Cartfile`.

```
github "willowtreeapps/spruce-ios"
```

# Getting Started
Spruce is entirely written in `Swift` and currently only supports `Swift`. `Objective C` wrappers are coming soon.

## Basic Usage
Spruce comes packed with `UIView` extensions meant to make your life easier when calling an animation. Let's say we want to `[.fadeIn, .expand(.slightly)]` our view. We will call that array of animations `ourAnimations`.

### Preparing for Animation
If you want a view to fade in, then you need to make sure that it is already faded out. To do that, we need to `prepare` the view. Spruce makes this easy by calling:

```swift
yourView.spruce.prepare(ourAnimations)
```
This `prepare` function will go through each view and set the `alpha = 0.0` and also shrink the view so that when the animation runs the view will revert to it's original position.

### Running the Animation 

Use the following command to run a basic animation on your view.

```swift
yourView.spruce.animate(ourAnimations)
```

Checkout [the documentation](https://willowtreeapps.github.io/spruce-ios/swift_output/Extensions/UIView.html#/s:vE6SpruceCSo6UIView6spruceVS_6Spruce) for more functions and how to better use the `animate` method.

## Using a SortFunction
Luckily, Spruce comes with around 8 `SortFunction` implementations with a wide open possibility to make more! Use the `SortFunction` to change the order in which views animate. Consider the following example:

```swift
let sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.1)
```
In this example we have created a `LinearSortFunction` which will have views animate in from the top to bottom. We can change the look and feel of the animation by using a `RadialSortFunction` instead which will have the views animate in a circular fashion. If we wanted to use this `sortFunction` in an actual Spruce `animate` call then that would look something like:

```swift
yourView.spruce.animate([.fadeIn, .expand(.slightly)], sortFunction: sortFunction)
```
Definitely play around with the stock `SortFunction` implementations until you find the one that is perfect for you! Check out the example app if you want to get previews of what each `SortFunction` will look like.

## Using a Custom Animation
Though Spruce comes with a ton of stock animations, sometimes it is easier to make your own. We definitely encourage customization and Spruce is ready for it! Let's say you want to transform and animate a `UIView` object. To do let's create a `PrepareHandler`:

```swift
let prepareHandler = { view in
	view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
}
```
The `prepareHandler` will be passed a `UIView` object by Spruce and then it is your functions job to get the view ready to animate. This way our animation will look clean and quick since the view is already scaled down and ready to grow! Now to setup the function to grow the view we need to create a `ChangeFunction`:

```swift
let changeFunction = { view in
	view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
}
```
In `changeFunction` the same view will also be passed in by Spruce and then your function will be used to animate the actual view itself. These two functions will be called with each subview of the view you are animating. Now that we have both functions we are ready to create an animation:

```swift
let animation = StockAnimation.custom(prepareFunction: prepareHandler, animateFunction: changeFunction)
```
Once we have the animation all we need to do is pass that animation into Spruce and let the animation begin!

```swift
yourView.spruce.animate([animation])
```

# Basic Concepts

## Animations
Given a change function that specifies how the views are modified, you are able to specify any type of animation that you would like. Feel free to implement the `Animation` protocol and create your own animation classes.

### The Animation Protocol
The protocol has one function and a variable that need to be implemented in your class. First is the `changeFunction`. This is a `void` function that takes one parameter of a `UIView`. The change function will specify all of the modifications that are going to be made to that view and this is what you would use to animate the changes. The function `animate` is called when Spruce wants to go ahead and run the animations on the view. It's important that the `changeFunction` is set before this call but Spruce should handle all of that for you. The `completion` parameter in the function call should be called by your function once the animation is complete.

```swift
var changeFunction: ChangeFunction? { get set }

func animate(delay: TimeInterval, view: UIView, completion: CompletionHandler?)
```

### Standard Animation
The `StandardAnimation` class uses the default `UIView.animate` function to apply the change function to the view. Use this class if you want to have a stock linear movement of the changes.

### Spring Animation
The `SpringAnimation` class uses the `UIView.animate(...usingSpringWithDamping)` function. With this class you can edit the `springDampening` and `initialVelocity` values so that your views will bounce on the screen.

## Sort Functions
With all different types of animations, especially those dealing with subviews, we have to consider a way in which we want to animate them. Some views can have 0 subviews while others may have hundreds. To handle this, we have the notion of a `SortFunction`. What this will do is take each of the subviews in the animated view, and apply a mapping from the specific subview to the exact delay that it should wait before animating. Some of these will sort in a radial formation while others may actually sort randomly. This is one of the cool features of Spruce, is you can actually define your own `SortFunction` and then the animation will look completely different. Luckily, Spruce also comes jam packed with a ton of default `SortFunction` classes to make everything easier on you as the developer. Take a look at some of the default `SortFunction` classes we have and see if you can use them or branch off of them for your cool and custom animations!

### The SortFunction Protocol
A very simple protocol that requires classes to implement the following function

```swift
func timeOffsets(view: UIView, recursiveDepth: Int) -> [TimedView]
```

What the above function needs to do is take in a `UIView` and generate a list of subviews. This list of subviews can be generated recursively or not depending on what the boolean has set. Once the list of subviews has been generated, you can define your own sort metric to determine in which order the `UIView`'s should animate. To do so, you need to create an array of `SpruceTimedView`'s. This special struct has two properties: (1) `view: UIView` and (2) `timeOffset: TimeInterval`. Your `SortFunction` can define the `timeOffset` however it likes, but the animation classes will use this to determine how long it should delay the start of that specific view from animating. The best way to learn, is to play around. So why not have some fun and make your own `SortFunction`!

### Stock Sort Functions
To make sure that developers can use Spruce out of the box, we included about 8 stock `SortFunction` implementations. These are some of the main functions we use at WillowTree and are so excited to see what others come up with!

- `DefaultSortFunction`
- `LinearSortFunction`
- `CorneredSortFunction`
- `RadialSortFunction`
- `RandomSortFunction`
- `InlineSortFunction`
- `ContinousSortFunction`
- `ContinuousWeightedSortFunction`

Check out the docs [here](https://willowtreeapps.github.io/spruce-ios/swift_output/Protocols/SortFunction.html) for more information

## Stock Animations
To make everybody's lives easier, the stock animations perform the basic `UIView` animations that a lot of apps use today. Mix and match these animations to get the core motion you are looking for.

- `.fadeIn`
- `.slide(<SlideDirection>, <Distance>)`
- `.spin(<Angle>)`
- `.expand(<Scale>)`
- `.contact(<Scale>)`
- `.custom(prepareFunction: <PrepareHandler>, animateFunction: <ChangeFunction>)`

Experiment which ones work for you! If you think of anymore feel free to add them to the library yourself!

# Example App
Use the [example app](https://github.com/willowtreeapps/spruce-ios/tree/master/Example) to find the right `SortFunction`. In the app you will be able to see how each `SortFunction` is implemented. As you swap among `SortFunction` types, the code will be displayed on the phone and printed to the Xcode console so that you can start adding Spruce to your own app right away! 

Also included in the sample app are the implementations for the two extensibility tests shown above that demonstrate how to use Spruce with a `UITableView` or `UICollectionView`.

# Contributing to Spruce
Contributions are more than welcome! Please see the [Contributing Guidelines](https://github.com/willowtreeapps/spruce-ios/blob/master/Contributing.md) and be mindful of our [Code of Conduct](https://github.com/willowtreeapps/spruce-ios/blob/master/code-of-conduct.md).

# Issues or Future Ideas
If part of Spruce is not working correctly be sure to file a Github issue. In the issue provide as many details as possible. This could include example code or the exact steps that you did so that everyone can reproduce the issue. Sample projects are always the best way :). 
This makes it easy for our developers or someone from the open-source community to start working!

If you have a feature idea submit an issue with a feature request or submit a pull request and we will work with you to merge it in!

# About WillowTree!
![WillowTree Logo](https://github.com/willowtreeapps/spruce-ios/raw/master/imgs/willowtree_logo.png)

We build apps, responsive sites, bots—any digital product that lives on a screen—for the world’s leading companies. Our elite teams challenge themselves to build extraordinary experiences by bridging the latest strategy and design thinking with enterprise-grade software development.

Interested in working on more unique projects like Spruce? Check out our [careers page](http://willowtreeapps.com/careers).
