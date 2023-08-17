# Podfile
require 'json'

source 'https://github.com/CocoaPods/Specs.git'
source 'git@github.com:MrZQxiao/ZQModule_Specs.git'


pre_install do |installer| Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_static_framework_transitive_dependencies) {}
end

platform :ios, "11.0"
# Xcode 10 / New Build System 禁用输入输出路径
install! 'cocoapods', :disable_input_output_paths => true
#install! 'cocoapods', :deterministic_uuids => false
#use_frameworks!
use_frameworks! :linkage => :static
inhibit_all_warnings!

target :ZQModuleDemo do
  
    # 配置组件pod
    # 指定环境，引用私有库代码： 请修改 innerPodConfig.json 配置文件
    # dependency_env:0 引用远端tag，远端需要打对应的tag，并且需要推送到MIS-Specs 仓库
    # dependency_env:1 引用远端tag
    # dependency_env:2 引用远端develop分支，远端需要develop分支
    # dependency_env:3 引用本地代码，
    json = File.read('innerPodConfig.json')
    JsonObj = JSON.parse(json)
    JsonObj["components"].each {
        |component|
        dependency_env = component["dependency_env"]
        dependency_pod = component["pod"]
        dependency_branch = component["branch"]
        dependency_version = component["version"]
        if dependency_env == 0
          pod dependency_pod, dependency_version
        elsif dependency_env == 1
          pod dependency_pod, :git => JsonObj["zq_git"] + '/' + dependency_pod + '.git', :tag => dependency_version
        elsif dependency_env == 2
          dependency_branch = (dependency_branch.blank?) ? JsonObj["branch"] : dependency_branch
          pod dependency_pod, :git => JsonObj["zq_git"] + '/' + dependency_pod + '.git', :branch => dependency_branch
        elsif dependency_env == 3
          pod dependency_pod, :path => JsonObj["repositoriesPath"] + dependency_pod
        end
    }
    
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['COMPILER_INDEX_STORE_ENABLE'] = "NO"
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      config.build_settings["EXCLUDED_ARCHS[sdk=iphoneos*]"] = "armv7"
      config.build_settings["ONLY_ACTIVE_ARCH"] = "YES"
    end
  end
end
