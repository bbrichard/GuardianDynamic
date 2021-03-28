Pod::Spec.new do |spec|
  spec.name         = "GuardianDynamic"
  spec.version      = "0.0.1"
  spec.summary      = "GuardianDynamic for components"
  spec.description  = <<-DESC
                      GuardianDynamic for components
                      DESC
  spec.homepage     = "https://github.com/bbrichard/GuardianDynamic"
  spec.license      = "MIT. Copyright (c) 2019年 BB. All rights reserved."
  spec.author       = { "Richard" => "Richard@seektopser.com" }
  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target = "9.0"

  spec.source = { :http  => 'https://github.com/bbrichard/GuardianDynamic/releases/download/0.0.1/Guardian.framework.zip' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.frameworks = 'AdSupport', 'AvFoundation', 'CoreTelephony', 'SystemConfiguration'
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.default_subspec = 'zip'
  spec.subspec 'zip' do |zip|
      puts '-------------------------------------------------------------------'
      puts 'Notice: GuardianDynamic is zip now'
      puts '-------------------------------------------------------------------'
      zip.ios.vendored_frameworks = '*.framework'
  end
  spec.prepare_command     = <<-EOF
  pwd
  ls -l
  mkdir Guardian.framework/Modules
  touch  Guardian.framework/Modules/module.modulemap
  cat <<-EOF > Guardian.framework/Modules/module.modulemap
  framework module Guardian {
      header "NTESCSGuardian.h"
  }
  \EOF
  EOF
end
