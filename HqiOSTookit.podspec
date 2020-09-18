Pod::Spec.new do |s|
  s.name = 'HqiOSTookit'
  s.version = '1.0.1'
  s.license = 'GNU'
  s.summary = 'HqiOSTookit'
  s.homepage = 'https://github.com/HeHuiqi/HqiOSTookit.git'
  s.authors = { 'Hehuiqi' => '1710308677@me.com' }
  s.social_media_url = 'https://github.com/HeHuiqi'
  s.source = { :git => 'https://github.com/HeHuiqi/HqiOSTookit.git', :tag => '1.0.1' }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.15'

  s.source_files = 'HqiOSTookit/HqiOSTookit/*.swift'

  s.swift_version = '5.0'
  
end