Pod::Spec.new do |s|
s.name             = 'CHICore'
s.version          = '0.1.8'
s.summary          = 'CHICore is a set of helpers and services for a project in CHili studio.'

s.ios.deployment_target = '8.0'
s.tvos.deployment_target = '9.0'

s.homepage         = 'https://github.com/chili-ios/CHICore'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Chili' => 'studio@chi.lv' }
s.source           = { :git => 'https://github.com/chili-ios/CHICore.git', :tag => s.version.to_s }

s.source_files = 'CHICore/Classes/**/*.swift'

end
