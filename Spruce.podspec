#
# Be sure to run `pod lib lint Spruce.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Spruce'
  s.version          = '0.1.0'
  s.summary          = 'A simple animation library that tries to do everything for you.'

  s.description      = <<-DESC
                       	Spruce is a very small, lightweight animation library that hopes to handle all of the complications of animations for you. So many developers use standard animations because they are easy and quick to use. With Spruce, developers will be able to create complex animations hopefully with just one line of code. These animations can include variations on fading, scale, spin, and many more. A key component of Spruce is that it is entirely customizable. If we don't have the exact animation you are looking to build, subclass one of our types and everything will just work.
			DESC

  s.homepage         = 'https://github.com/willowtreeapps/spruce-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jackson Taylor' => 'jackson.taylor@willowtreeapps.com' }
  s.source           = { :git => 'https://github.com/willowtreeapps/Spruce.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Sources/Classes/**/*'
end
