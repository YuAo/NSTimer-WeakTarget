Pod::Spec.new do |s|
  s.name         = 'NSTimer+WeakTarget'
  s.version      = '1.1'
  s.summary      = "A NSTimer category which adds the support of weak target for NSTimer"
  s.homepage     = "https://github.com/YuAo/NSTimer-WeakTarget"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'YuAo' => 'me@imyuao.com' }
  s.requires_arc = true
  s.platform     = :ios, '7.0'
  s.source_files = 'NSTimer+WeakTarget/*.{h,m}'
  s.source       = { :git => "https://github.com/YuAo/NSTimer-WeakTarget.git", :tag => "1.1" }
  s.module_name = 'NSTimerWeakTarget'
end
