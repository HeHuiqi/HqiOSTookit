#
#  Be sure to run `pod spec lint HQSegmentPageViewController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
Pod::Spec.new do |s|
  s.name     = 'HqiOSTookit'
  s.version  = '1.0.2'
  s.license  =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'HQSegmentPageViewController'
  s.homepage = 'https://github.com/HeHuiqi/'
  s.author   = 'Hehuiqi'
  s.source   = { :git => 'https://github.com/HeHuiqi/HqiOSTookit.git', :tag => s.version }
  s.platform = :ios, '10.0'
  s.source_files = 'HqiOSTookit/HqiOSTookit/*.swift'
  s.requires_arc = true
  s.swift_version = '5.0'
  
end