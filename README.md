# Spruce iOS Animation Library

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-compatible-4BC51D.svg?style=flat)](https://github.com/CocoaPods/CocoaPods)
[![License None](https://img.shields.io/badge/License-none-blue.svg?style=flat)]()
[![Public No](https://img.shields.io/badge/Public-no-red.svg?style=flat)]()


## What is it?
Spruce is a very small, lightweight animation library that hopes to handle all of the 
complications of animations for you. So many developers use standard animations because
they are easy and quick to use. With Spruce, developers will be able to create complex
animations hopefully with just one line of code. These animations can include variations
on fading, scale, spin, and many more. A key component of Spruce is that it is entirely
customizable. If we don't have the exact animation you are looking to build, subclass
one of our types and everything will just work. 

## Installation Instructions
To make everything super easy, we currently support both CocoaPods and Carthage. If you want to just do everything yourself without a package manager, checkout our releases page and download the pre-built frameworks there or you can download the exact source from this github project.

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

## How to use it

### UIViewController Subclass
A lot of developers want to have the basics done for them to get a running example. If this
is you, then why not simply change your view controllers to subclass `SpruceViewController`
instead of `UIViewController`. This will add quite a few variables to your class that are to
be used for animating the entrance of your view. 

The variables added are all mutable and should be updated before the `super.viewDidLoad` call. 

Variable     | Type          | Description
------------ | ------------- | -------------
animations | `[SpruceStandardAnimation]` | An array of all the animations that should be run when the view appears. See the `SpruceStandardAnimation` enumeration for types.
duration   | `TimeInterval` | Duration for each of the animations that are applied to the subviews. Default value 0.3s.
animationType | `SpruceAnimation` | The style of the animation that should be applied to the subviews
sortFunction | `SortFunction` | The function in which to define the inter-interval timings between each of the subviews
animationView | `UIView?` | The view that will be used to grab the subviews from

Once the view controller is subclassed, all subviews of the animation view will be cleared on `viewDidLoad`.
This means that if you are overriding the `viewDidLoad` method then you need to call `super.viewDidLoad` in order
for the starting point of the animation to be setup. Once the view appears on the screen (`viewDidAppear`) the
animation blocks will be called for each of the subviews. 

### UIView Extensions
In order to reduce the need for subclassing anything, Spruce has built in `UIView` extensions so
that you can easily call all of the spruce methods on any subclass of `UIView`. 

#### .spruceUp(withAnimations: [SpruceStandardAnimation])
Very basic call that uses all of the default timing functions, sort functions, and animation styles. The only info needed is the type of animations that you would like to run on the subviews.

Example Call:
```swift
let yourView = // this is the view to animate
yourView.spruceUp(withAnimations: [.fadeIn, .slide(.up, .small), .expand(.small)])
```

#### .spruceUp(withAnimations: [SpruceStandardAnimation], duration: TimeInterval)
Same as the basic call above except with the ability to override the duration used for the animation. Keep in mind that duration does not mean duration of all the animations combined but the duration of the animation of each UIView that is a subview of the animating view. 

Example Call:
```swift
let yourView = // this is the view to animate
yourView.spruceUp(withAnimations: [.fadeIn, .slide(.up, .small), .expand(.small)], duration: 0.3)
```

#### .spruceUp(withAnimations: [SpruceStandardAnimation], duration: TimeInterval, animationType: SpruceAnimation)
Same as the methods above with the customizable component of `animationType`. Setting the animation type allows you to change the actualy UIViewAnimation that occurs for each of the changes. For example, this could be the difference of a `UIView.animate(withDuration:)` and `UIView.animate(... usingSpringWithDamping:...)`. 

Example Call:
```swift
let yourView = // this is the view to animate
let animation = StandardAnimation(duration: duration)
yourView.spruceUp(withAnimations: [.fadeIn, .slide(.up, .small), .expand(.small)], duration: 0.3, animationType: animation)
```

#### .spruceUp(withAnimations: [SpruceStandardAnimation], duration: TimeInterval, sortFunction: SortFunction)
Adding on another customizable component is the sortFunction. The sortFunction is used to determine which UIViews are animated when so that you can have cool cascading effects or all subviews can animate at the same time. (See SortFunction for more information). 

Example Call:
```swift
let yourView = // this is the view to animate
let animation = StandardAnimation(duration: duration)
let sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
yourView.spruceUp(withAnimations: [.fadeIn, .slide(.up, .small), .expand(.small)], duration: 0.3, animationType: animation, sortFunction: sortFunction)
```

# Basic Concepts

## Sort Functions
With all different types of animations, especially those dealing with subviews, we have to consider a way in which we want to animate them. Some views can have 0 subviews while others may have hundreds. To handle this, we have the notion of a `SortFunction`. What this will do is take each of the subviews in the animated view, and apply a mapping from the specific subview to the exact delay that it should wait before animating. Some of these will sort in a radial formation while others may actually sort randomly. This is one of the cool features of Spruce, is you can actually define your own `SortFunction` and then the animation will look completely different. Luckily, Spruce also comes jam packed with a ton of default `SortFunction` classes to make everything easier on you as the developer. Take a look at some of the default `SortFunction` classes we have and see if you can use them or branch off of them for your cool and custom animations!

### The SortFunction Protocol
A very simple protocol that requires classes to implement the following function

```swift
func getTimeOffsets(view: UIView, recursive: Bool) -> [SpruceTimedView]
```

What the above function needs to do is take in a `UIView` and generate a list of subviews. This list of subviews can be generated recursively or not depending on what the boolean has set. Once the list of subviews has been generated, you can define your own sort metric to determine in which order the `UIView`'s should animate. To do so, you need to create an array of `SpruceTimedView`'s. This special struct has two properties: (1) `view: UIView` and (2) `timeOffset: TimeInterval`. Your `SortFunction` can define the `timeOffset` however it likes, but the animation classes will use this to determine how long it should delay the start of that specific view from animating. The best way to learn, is to play around. So why not have some fun and make your own `SortFunction`!


### Default SortFunction Classes
This is the list of `SortFunction` classes that come default with Spruce so that you can have a beautiful animation up and running in seconds. 

#### Linear Sort Function
With a `LinearSortFunction` you are able to define a `SpruceDirection` and a `TimeInterval` for which is used to determine the inter object delay. To create a `LinearSortFunction`:

```swift
LinearSortFunction(direction: <SpruceDirection>, interObjectDelay: <TimeInterval>)

// Example
let sortFunction = LinearSortFunction(direction: .leftToRight, interObjectDelay: 0.2)
```

With the above `sortFunction` we can create a simple animation that looks like. [Insert Image here of linear Sort Funtion]

Values for `SpruceDirection` include: `.topToBottom`, `.bottomToTop`, `.leftToRight`, and `.rightToLeft`.

#### Cornered Sort Function
With a `CorneredSortFunction` you can specify a `SpruceCorner` and a `TimeInterval` to determine the inter object delay. To create a `CorneredSortFunction`:

```swift
CorneredSortFunction(corner: <SpruceCorner>, interObjectDelay: TimeInterval)

// Example
let sortFunction = CorneredSortFunction(corner: .topLeft, interObjectDelay: 0.2)
```

With the above `sortFunction` the animation looks like. [Insert Image here]

Values for `SpruceCorner` include: `.topLeft`, .`topRight`, `.bottomLeft`, `.bottomRight`.

#### Default Sort Function
A `DefaultSortFunction` gives each view an inter object delay based on where it is located in the `subviews` array. No sorting is done on the `SortFunction` side. To create a `DefaultSortFunction`:

```swift
DefaultSortFunction(interObjectDelay: <TimeInterval>)

// Example
let sortFunction = DefaultSortFunction(interObjectDelay: 0.2)
```

The above `sortFunction` would make an animation look like. [Insert Image here]

#### Inline Sort Function
An `InlineSortFunction` animates the views as if they were lines in a paragraph. Meaning that it will finish animating a line before starting the next line. To create an `InlineSortFunction`:

```swift
InlineSortFunction(interObjectDelay: <TimeInterval>)

// Example
let sortFunction = InlineSortFunction(interObjectDelay: 0.2)
```

The above `sortFunction` would make an animation look like. [Insert Image here]

#### Radial Sort Function
To create an animation that emits in a circular pattern from a given point, you would want to use a `RadialSortFunction`. Like the other `BaseDistanceSortFunctions` you can use the `reversed` flag to sort the subviews in the initial way and then animate in the opposite direction. This way rather than the views animating outwards, they will start on the outside and then animate in. To create a `RadialSortFunction`:

```swift
RadialSortFunction(position: <SprucePosition>, interObjectDelay: <TimeInterval>)

// Example
let sortFunction = RadialSortFunction(position: .topMiddle, interObjectDelay: 0.2)
```

The above `sortFunction` would make an animation look like. [Insert Image here]
