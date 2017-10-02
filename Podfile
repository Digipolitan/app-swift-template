workspace 'AppSwiftTemplate.xcworkspace'

abstract_target 'Common' do
	# Comment the next line if you're not using Swift and don't want to use dynamic frameworks
	use_frameworks!

	pod 'DependencyInjectorObjectMapper'
	pod 'AlamofireLogging'
	pod 'IdylleClient'
	pod 'RuntimeEnvironment'

	target 'Domain' do
		project 'Domain.xcodeproj'
		platform :ios, '8.0'
	end

  target 'AppSwiftTemplate' do
			project 'AppSwiftTemplate.xcodeproj'
      platform :ios, '8.0'
  end
end
