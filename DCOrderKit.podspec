#
# Be sure to run `pod lib lint PodspecLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DCOrderKit' # 库名称，不能跟现有cocoapods仓库里的库名同名，同名会有冲突，一般可以加上个人的私有前缀
  s.version          = '0.0.1' # 库的版本号，一般以0.0.1版本开始，注意这里的版本号要跟git里tag标签一样，每个版本都需要打上跟version同样名称的tag，并推送到远程仓库
  s.summary          = 'DCOrderKit Demo' # 概要

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
# description指的是对库的描述，平时我们使用pod search 库名的时候，每个库有一个简单的介绍，指的就是这个description
  s.homepage         = 'https://github.com/lillysdq/DCOrderKit.git' # 主页，一般都填写git仓库的主页URL
  
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' } # license默认就好，不要去改动
  s.author           = { 'xiobg@icloud.com' => 'xiobg@icloud.com' } # 作者相关信息，一般形式是'作者名' => '联系方式'
  s.source           = { :git => 'https://github.com/lillysdq/DCOrderKit.git', :tag => s.version.to_s } # 源码，这里填写库的Git地址，别人使用你的库时，pod是根据这个Git地址来打包编译的
  # s.social_media_url = 'https://github.com/DiaoShiNanShi' # 社交地址，可以填写自己对应博客或网站的地址
  s.platform = :ios
  s.ios.deployment_target = '13.0' # 库发布的iOS适配版本号，一般指最低支持的iOS版本
  s.source_files = 'DCOrderKit/Classes/**/*' # 库的源码，需要明确指定，pod编译打包库时编译的就是这里指定的源码，一般都以通配符形式匹配
  s.swift_versions = '5.0'
  
  # s.resource_bundles = {
  #   'PodspecLib' => ['PodspecLib/Assets/*.png']
  # }
# resource_bundles指的是资源文件，一般指图片、xib、storyboard、配置文件等
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # 开放的公共头
  s.frameworks = 'UIKit'
  # 私有库需要依赖系统的哪些framework，需要这里明确指定
  # s.dependency 'AFNetworking', '~> 2.3'
  # 私有库如果需要依赖其他第三方pod，需要这里指定，多个时需要同样格式指定多个
  # s.pod_target_xcconfig = { 'VALID_ARCHS' => 'arm64 armv7 x86_64' }

end
