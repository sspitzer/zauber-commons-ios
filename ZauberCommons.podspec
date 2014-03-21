Pod::Spec.new do |s|
  s.name         = 'ZauberCommons'
  s.version      = '0.1.0'
  s.summary      = 'A library with common classes and categories.'
  s.author       = { 'Hernán Zalazar' => 'hernan@zauberlabs.com' }
  s.homepage     = 'https://github.com/zauberlabs/zauber-commons-ios'
  s.source       = { :git => 'https://github.com/zauberlabs/zauber-commons-ios.git', :tag => '0.1.0' }
  s.platform     = :ios, '5.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.default_subspec = "Base"

  s.subspec 'Base' do |base|
    base.source_files = 'Classes/ios/Base/*.{h,m}'
  end

  s.subspec 'Navigation' do |nav|
    nav.source_files = 'Classes/ios/Navigation/*.{h,m}'
  end

end
