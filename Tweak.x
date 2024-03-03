#import <Foundation/Foundation.h>

%hook UBNetworkSecurityPolicy
+ (NSSet*) getUberPinnedKeysFromFileURL {
    return [NSSet set];
}

+ (NSSet*) loadKeysFromBundle:(id)bundle certBundleName:(id)bundleName bundleExtension:(id)bundleExtension {
    return [NSSet set];
}
%end

%hook UBNetworkSecurityDigest
+ (id /* SecKeyRef */) getPinnedHashForPublicKey:(id)publicKey {
    return nil;
}
%end

%hook UBCronetConfiguration
    - (void) setEnableQuic:(BOOL)shouldEnableQuic {
        %orig(false);
    }
    
    - (BOOL) enableQuic {
        return false;
    }
    
    - (void) setQuicHints:(id)quicHints { }
    
    - (void) configureQuicHintDomainNames:(id)domainNames { }
%end

%hook HHClientConfiguration
    - (void) setEnableQUIC:(BOOL)shouldEnableQuic {
        %orig(false);
    }
    
    - (void) setQUIC_parameters:(id)quicParams { }
    
    - (BOOL) enableQUIC {
        return false;
    }
%end

%hook CronetDispatcher
    - (instancetype) initWithQuic:(BOOL)shouldEnableQuic QUIC_parameters:(id)quicParams publicKeys:(id)publicKeys netLog:(id) netLog cacheFolder:(id)cacheFolder {
        return %orig(false, quicParams, publicKeys, netLog, cacheFolder);
    }
    
    - (void) setQUIC_parameters:(id)quicParams { }
    
    - (BOOL) enableQUIC {
        return false;
    }
%end