Pod::Spec.new do |s|

  s.name             = "PhotoMozaic"
  s.version          = "0.2.1"
  s.summary          = "Affichage des photos en mozaic."
  s.homepage         = "https://github.com/slecoustre/PhotoMozaic"
  s.screenshots      = "https://raw.githubusercontent.com/slecoustre/PhotoMozaic/master/ScreenShot.png"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Stéphane LE COUSTRE" => "slecoustre@fettle.fr" }
  s.source           = { :git => "https://github.com/slecoustre/PhotoMozaic.git", :tag => s.version.to_s }

  s.platform     = :ios, "8.0"
  s.requires_arc = false

  s.source_files = "Classes", "Classes/**/*"
  s.frameworks   = "UIKit"
  s.dependency "SDWebImage"
end
