Pod::Spec.new do |s|

  s.name         = "CTabBarController"
  s.version      = "0.1.0"
  s.summary      = "Customizable tabbarcontroller for iOS"
  s.description  = <<-DESC
                  This projects creates a custom TabBarController and NavigationController
                  to customize tabbar. UITabBar doesn't lets you big customization to UI. This
                  framework lets you create custom tabbars and use with the CTabBarController.
                   DESC
  s.homepage     = "https://github.com/ogantopkaya/CTabBarController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Ogan Topkaya" => "otopkaya@me.com" }
  s.social_media_url   = "https://twitter.com/ogantopkaya"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/ogantopkaya/CTabBarController.git", :tag => "0.1.0" }
  s.source_files  = "src", "src/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.framework  = "UIKit"
end
