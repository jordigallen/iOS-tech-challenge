# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
source 'https://github.com/CocoaPods/Specs.git'

# Comment the next line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!

# Comment the next line if you want the compiler to throw warnings regarding the Pods implementation
inhibit_all_warnings!

$alamofire_version = '5.4.1'
$promise_kit_version = '6.13.1'
$swiftgen_version = '6.4.0'
$swinject_version = '2.7.1'
$swinjectStoryboard_version = '2.2.0'
$swiftLint_version = '0.43.1'
$rxSwift_version = '5.0.1'
$rxCocoa_version = '5.0.1'
# $nimble_version = '8.0.4'
# $snapshotTesting_version = '1.8.2'
# $swifter_version = '1.5.0'

def app_pods
  pod 'Alamofire', $alamofire_version
  pod 'SwiftLint', $swiftLint_version
  pod 'SwiftGen', $swiftgen_version
  pod 'Swinject', $swinject_version
  pod 'SwinjectStoryboard', $swinjectStoryboard_version
  pod 'RxSwift', $rxSwift_version
  pod 'RxCocoa', $rxCocoa_version
end

# Pods RakutenTV
target 'RakutenTV' do
  app_pods
end

target 'RakutenTVTests' do
  inherit! :search_paths
  app_pods
#   pod 'Nimble', $nimble_version
#   pod 'SnapshotTesting', $snapshotTesting_version
end

target 'RakutenTVUITests' do
  inherit! :search_paths
  app_pods
#   pod 'Swifter', $swifter_version
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts target.name
    target.build_configurations.each do |config|
       config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
    end
  end
end
