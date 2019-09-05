#
# Be sure to run `pod lib lint AppManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppManager'
  s.version          = '0.1.1'
  s.summary          = 'App manager for iOS app development.'
  s.swift_versions   = ['5.0']

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Some useful code collection for speeding up app development.
                       DESC

  s.homepage         = 'https://github.com/xinus/AppManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Xinus' => 'xinus.wang@gmail.com' }
  s.source           = { :git => 'https://github.com/xinus/AppManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AppManager/Sources/**/*'
  
  # s.resource_bundles = {
  #   'AppManager' => ['AppManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  
  # Dependency - Crypto
  s.dependency 'CryptoSwift', '~> 1.0.0'
  
  # Dependency - Keychain
  s.dependency 'KeychainSwift', '~> 16.0.1'
  
  # Dependency - Network
  s.dependency 'Moya/RxSwift', '~> 13.0.1'
  
  # Dependency - Router
  s.dependency 'URLNavigator', '~> 2.2.0'
  
  # Dependency - IoC
  s.dependency 'Swinject', '~> 2.7.0'

  # Dependency - Utility
  s.dependency 'SwifterSwift', '~> 5.0.0'
  
  # Dependency - Rx
  s.dependency 'RxCocoa', '~> 4.5.0'
  
  # Dependency - Social Network
  s.dependency 'MonkeyKing', '~> 1.15.0'
  
  # Dependency - Logger
  s.dependency 'CocoaLumberjack/Swift', '~> 3.5.3'

end
