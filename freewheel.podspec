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

  #######
  # iOS #
  #######

  s.ios.deployment_target = '9.0'
  s.ios.vendored_frameworks = 'iOS/universal/AdManager.framework'
  s.ios.pod_target_xcconfig = { # since we don't have i386 arch
   'VALID_ARCHS' => 'x86_64 arm64 armv7',
   'ARCHS' => 'x86_64 arm64 armv7'
  }

  ########
  # tvOS #
  ########

  s.tvos.deployment_target = '9.0'
  s.tvos.vendored_frameworks = 'tvOS/universal/AdManager.framework'
end
