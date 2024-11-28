#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint khqr.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_bakong_khqr'
  s.version          = '0.0.3'
  s.summary          = 'This plugin use for generate Bakong KHQR for online payment in Cambodia.'
  s.description      = <<-DESC
Simplify your life with Cambodia's only all-in-one mobile payment and banking app. Bakong redefines mobile payment and banking by combining e-wallets, mobile payments, online banking and financial applications within one easy-to-use interface for any preferred bank account. Stop switching between apps today and enjoy unrivalled simplicity, convenience and security with Bakong.
                       DESC
  s.homepage         = 'https://github.com/sokhatim'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Sokha Tim' => 'sokhatim23@gamil.com' }
  s.source           = { :http => 'https://github.com/sokhatim/flutter_bakong_khqr' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'BakongKHQR', '~> 1.0.0.15'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'khqr_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
