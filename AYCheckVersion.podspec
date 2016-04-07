Pod::Spec.new do |s|
  s.name         = "AYCkeckVersion"
  s.version      = "1.0.0"
  s.summary      = "Check version from AppStore"
  s.homepage     = "https://github.com/AYJk/AYCheckVersion"
  s.license      = "MIT"
  s.author             = { "Andy" => "andy5759520@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/AYJk/AYCheckVersion.git", :tag => "1.0.0" }
  s.source_files = "AYCkeckVersion/Classes/*.{h,m}"
  s.requires_arc = true

end
