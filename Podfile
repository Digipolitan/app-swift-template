workspace 'AppSwiftTemplate.xcworkspace'

abstract_target 'Common' do
	use_frameworks!

	pod 'DependencyInjectorObjectMapper'
	pod 'AlamofireLogging'
	pod 'IdylleClient'
	pod 'RuntimeEnvironment'
	pod 'LocalizationToolkitObjectMapper'

	target 'Domain' do
		project 'Domain.xcodeproj'
		platform :ios, '8.0'
	end

    target 'AppSwiftTemplate' do
        project 'AppSwiftTemplate.xcodeproj'
        platform :ios, '8.0'

        pod 'SwiftMessages'
        pod 'AutomaticKeyboard'
        pod 'Monet'
        pod 'SessionKit'
        pod 'SplashKit'
        pod 'Roadblock'
    end
end
