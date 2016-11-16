# Spruce iOS Animation Library

## What is it?
Spruce is a very small, lightweight animation library that hopes to handle all of the 
complications of animations for you. So many developers use standard animations because
they are easy and quick to use. With Spruce, developers will be able to create complex
animations hopefully with just one line of code. These animations can include variations
on fading, scale, spin, and many more. A key component of Spruce is that it is entirely
customizable. If we don't have the exact animation you are looking to build, subclass
one of our types and everything will just work. 

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

