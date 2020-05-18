Pod::Spec.new do |spec|
	spec.name                  = "TWLOCKit"
	spec.version               = "0.0.3"
	spec.summary               = "Some quick functions for iOS."
	spec.homepage              = "https://github.com/LongerONE/TWLOCKit"
	spec.license               = "MIT"
	spec.author                = { "LongerONE" => "tangwanlong425@qq.com" }
	spec.platform              = :ios, "8.0"
	spec.source                = { :git => "https://github.com/LongerONE/TWLOCKit.git", :tag => "#{spec.version}" }
	spec.source_files          = "TWLOCKit/TWLOCKit/**/*.{h,m}"
	spec.framework             = "UIKit"
	spec.framework             = "AVFoundation"
	spec.framework             = "Security"
	spec.requires_arc          = true
end
