
#
#  Be sure to run `pod s lint CLExtensions.pods' to ensure this is a
#  valid s and to remove all comments including this before submitting the s.
#
#  To learn more about Pods attributes see https://guides.cocoapods.org/syntax/pods.html
#  To see working Podss in the CocoaPods repo see https://github.com/CocoaPods/ss/
#

Pod::Spec.new do |s|
  s.name              = "BMChineseSorting"
  s.version           = "0.2.5"
  s.summary           = "BMChineseSort."
  s.homepage          = "https://github.com/Baymax0/BMChineseSortSwift"
  s.license           = { :type => "MIT", :file => "LICENSE" }
  s.author            = { "Baymax0" => "jzdd327@163.com" }
  s.source            = { :git => "https://github.com/Baymax0/BMChineseSortSwift.git", :tag => s.version }
  s.documentation_url = 'https://github.com/Baymax0/BMChineseSortSwift'

  s.source_files = 'Sources/*.swift'

  s.ios.deployment_target = '10.0'
  
  s.swift_versions = ['5.0', '5.1', '5.2', '5.3']
end