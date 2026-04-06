require "json"

Pod::Spec.new do |s|
  # NPM package specification
  package = JSON.parse(File.read(File.join(File.dirname(__FILE__), "package.json")))

  s.name         = "RNThermalReceiptPrinter"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.license      = package["license"]

  s.author       = { package["author"]["name"] => package["author"]["email"] }
  s.homepage     = package["homepage"]
  s.platforms    = { ios: '11.0', tvos: '11.0', osx: '10.15', visionos: '1.0' }
  
  s.source       = { :git => "https://github.com/Bluu/react-native-thermal-receipt-printer.git", :tag => "v#{s.version}" }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc = true
  s.ios.vendored_libraries = "ios/PrinterSDK/libPrinterSDK.a"
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${PROJECT_DIR}/PrinterSDK"/**' }

  s.dependency "React"

end
