#
# Be sure to run `pod lib lint iTunesRSSObjc.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "iTunesRSSObjc"
  s.version          = "0.1.0"
  s.summary          = "iTunes RSS Objective-C wrapper"
  s.description      = <<-DESC
                       iTunes RSS Objective-C wrapper
                       DESC
  s.homepage         = "https://github.com/robmaceachern/iTunesRSSObjc"
  s.license          = 'MIT'
  s.author           = { "Rob MacEachern" => "rob@robmaceachern.com" }
  s.source           = { :git => "https://github.com/robmaceachern/iTunesRSSObjc.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/robmaceachern'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'iTunesRSSObjc' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'AFNetworking', '~> 2.5'
  s.dependency 'Ono', '~> 1.1.3'
  s.dependency 'AFOnoResponseSerializer', '~> 1.0.0'
end
