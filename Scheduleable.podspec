#
# Be sure to run `pod lib lint Scheduler.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Scheduleable'
  s.version          = '1.0.3'
  s.summary          = 'Thread scheduler.'
  s.homepage         = 'https://github.com/GodL/Scheduler'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '547188371@qq.com' => '547188371@qq.com' }
  s.source           = { :git => 'https://github.com/GodL/Scheduler.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Scheduler/Classes/**/*'
  s.dependency 'Disposable'
  s.swift_version = '5.2'
end
