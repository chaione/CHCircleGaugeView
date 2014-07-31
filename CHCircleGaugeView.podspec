Pod::Spec.new do |s|
  s.name         = "CHCircleGaugeView"
  s.version      = "1.0.0"
  s.summary      = "A circle gauge view."
  s.description  = <<-DESC
                   A configurable chart that depicts the value of a measurement using a subtle animation.
                   DESC
  s.homepage     = "https://github.com/chaione/CHCircleGauge"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors       = { "Matthew Morey" => "me@matthewmorey.com", "Rogelio Gudino" => "cananito@gmail.com" }
  s.social_media_url = 'https://twitter.com/xzolian'
  s.platform     = :ios
  s.source       = { :git => "https://github.com/chaione/CHCircleGaugeView.git", :tag => 'v1.0.0' }
  s.source_files = "CHCircleGaugeView/*.{h,m}"
  s.requires_arc = true
end
