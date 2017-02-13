# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Community' do

	pod 'Firebase/Core'
	pod 'Firebase/Auth'
    pod 'Firebase/Database'
    
    source 'https://github.com/CocoaPods/Specs.git'
    platform :ios, '9.0'
    use_frameworks!
    
    pod 'Eureka', '~> 2.0.0-beta.1'
    
    pod 'FacebookCore'
    pod 'FacebookLogin'
    pod 'FacebookShare'
    
    target 'CommunityTests' do
        inherit! :search_paths
        pod 'Firebase'
        pod 'Eureka', '~> 2.0.0-beta.1'
        
        pod 'FacebookCore'
        pod 'FacebookLogin'
        pod 'FacebookShare'
        pod 'Firebase/Core'
        pod 'Firebase/Auth'
        pod 'Firebase/Database'
    end

end
