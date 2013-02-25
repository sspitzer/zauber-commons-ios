Pod::Spec.new do |s|
  s.name         = 'ZauberCommons'
  s.version      = '0.0.1'
  s.summary      = 'A library with common classes and categories.'
  s.author       = { 'Hernán Zalazar' => 'hernan@zauberlabs.com' }
  s.homepage     = 'https://github.com/zauberlabs/zauber-commons-ios'
  s.source       = { :git => 'https://github.com/zauberlabs/zauber-commons-ios.git', :tag => '0.0.1' }
  s.source_files = 'Classes'
  s.platform     = :ios, '5.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
end