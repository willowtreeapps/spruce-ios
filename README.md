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
animations | [SpruceStandardAnimation] | An array of all the animations that should be run when the view appears. See the `SpruceStandardAnimation` enumeration for types.
duration   | TimeInterval | Duration for each of the animations that are applied to the subviews. Default value 0.3s.
animationType | SpruceAnimation | The style of the animation that should be applied to the subviews
sortFunction | SortFunction | The function in which to define the inter-interval timings between each of the subviews
animationView | UIView? | The view that will be used to grab the subviews from
