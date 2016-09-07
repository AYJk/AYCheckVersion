Pod::Spec.new do |s|
  s.name         = "AYCheckVersion"
  s.version      = "1.1.2"
  s.summary      = "Check version from AppStore"
  s.homepage     = "https://github.com/AYJk/AYCheckVersion"
  s.license      = "MIT"
  s.author             = { "Andy" => "andy5759520@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/AYJk/AYCheckVersion.git", :tag => "1.1.2" }
  s.source_files = "AYCheckVersion/Classes/*.{h,m}"
  s.requires_arc = true

end
