#
# Be sure to run `pod lib lint PhotoMozaic2.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PhotoMozaic"
  s.version          = "0.1"
  s.summary          = "Affichage des photos en mozaic."
  s.description      = ""
  s.homepage         = "https://github.com/slecoustre/PhotoMozaic"
  s.screenshots     = "https://raw.githubusercontent.com/slecoustre/PhotoMozaic/master/ScreenShot.png"
  s.license          = 'MIT'
  s.author           = { "Stéphane LE COUSTRE" => "slecoustre@fettle.fr" }
  s.source           = { :git => "https://github.com/slecoustre/PhotoMozaic.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*'

  s.dependency 'SDWebImage'
end
