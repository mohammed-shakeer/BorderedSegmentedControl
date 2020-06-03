#
# Be sure to run `pod lib lint BorderedSegmentedControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BorderedSegmentedControl'
  s.version          = '0.1.6'
  s.summary          = 'BorderedSegmentedControl is a easy custom Segmented control with a bottom bordered UI that lets you quickly integrate it in your code.'
  s.swift_versions   = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
BorderedSegmentedControl is a easy custom Segmented control with a bottom bordered UI that lets you quickly integrate. it has properties exposed to customize the segmented control
                       DESC

  s.homepage         = 'https://github.com/Mohammed-Shakeer/BorderedSegmentedControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohammed Shakeer' => 'k.mohammed.shakeer@gmail.com' }
  s.source           = { :git => 'https://github.com/Mohammed-Shakeer/BorderedSegmentedControl.git', :tag => '0.1.6' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'BorderedSegmentedControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BorderedSegmentedControl' => ['BorderedSegmentedControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
