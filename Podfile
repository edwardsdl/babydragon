source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!

target 'BabyDragon' do
  pod 'cocos2d', '= 2.1'
  pod 'ZBarSDK'
end

target 'BabyDragonTests' do
end

post_install do |installer|
  installer.project.targets.each do |target|
    target.build_configurations.each do |configuration|
      target.build_settings(configuration.name)['ARCHS'] = '$(ARCHS_STANDARD_32_BIT)'
    end
  end
end

