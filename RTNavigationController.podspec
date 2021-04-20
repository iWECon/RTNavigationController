Pod::Spec.new do |s|

    s.name = 'RTNavigationController'
    s.version = '5.3.1'
    s.license = { :type => 'MIT' }
    s.homepage = 'https://www.iwecon.cc'
    s.authors = 'Pansitong iWw'
    s.ios.deployment_target = '10.0'
    s.summary = 'RTNavigationController fork from `https://github.com/rickytan/RTNavigationController`'
    s.source = { :git => 'https://github.com/iWECon/RTNavigationController.git', :tag => s.version }
    s.source_files = [
        'Sources/**/*.{h,m}',
    ]
    s.resource_bundles = {
        'RTNavigationController' => ["Sources/RTNavigationController/*.xcassets"]
    }
    
    s.cocoapods_version = '>= 1.10.0'
    
    # dependencies
    s.dependency 'DZNEmptyDataSet'
    s.dependency 'MultiScrollContainer'
    s.dependency 'Pager'
    s.dependency 'ReactiveCocoa'
    s.dependency 'ReactiveSwift'
    s.dependency 'SegmentedController'
    
end
