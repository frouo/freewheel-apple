Pod::Spec.new do |s|
  s.name         = 'freewheel'
  s.version      = '2'
  s.summary      = 'francetv take on creating a pod for Freewheel AdManager iOS and tvOS SDK'
  s.homepage     = 'https://github.com/francetv/freewheel-apple'
  s.authors      = {
    'William Archimede' => 'william.archimede.ext@francetv.fr',
    'François Rouault' => 'francois.rouault.ext@francetv.fr'
  }
  s.license      = {
    :type => 'Copyright',
    :file => 'LICENSE.txt'
  }
  s.source       = { 
    :git => 'https://github.com/francetv/freewheel-apple.git',
    :tag => s.version.to_s
  }

  s.static_framework = false

  s.libraries = 'xml2'

  #######
  # iOS #
  #######

  s.ios.deployment_target = '9.0'
  s.ios.vendored_frameworks = 'iOS/AdManager.framework'
  s.ios.pod_target_xcconfig = { # since we don't have i386 arch
   'VALID_ARCHS' => 'x86_64 arm64 armv7',
   'ARCHS' => 'x86_64 arm64 armv7'
  }

  s.ios.public_header_files = 'iOS/BridgingHeader-ios.h'
  s.ios.xcconfig = { 'SWIFT_OBJC_BRIDGING_HEADER' => '${PODS_ROOT}/Headers/Public/freewheel/BridgingHeader-ios.h' }

  ########
  # tvOS #
  ########

  s.tvos.deployment_target = '9.0'
  s.tvos.vendored_frameworks = 'tvOS/AdManager.framework'

  s.tvos.public_header_files = 'tvOS/BridgingHeader-tvos.h'
  s.tvos.xcconfig = { 'SWIFT_OBJC_BRIDGING_HEADER' => '${PODS_ROOT}/Headers/Public/freewheel/BridgingHeader-tvos.h' }
end
