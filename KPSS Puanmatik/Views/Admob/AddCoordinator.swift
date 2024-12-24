import Foundation
import GoogleMobileAds
 
class AdCoordinator: NSObject, GADFullScreenContentDelegate {  // geçiş reklamı için istek oluşturuyor
    
    static let shared = AdCoordinator()
    private var ad: GADInterstitialAd?
    
    override init() {
        super.init()
        loadAd()
        print("Ad Coordinator Initialized")
    }
    
    func loadAd() {
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-2668993362842600/1886183961", request: GADRequest()) { ad, error in
            if let error = error{
                return print("Failed to load ad with error: \(error.localizedDescription)")
            }
            self.ad = ad
        }
    }
    
    func presentAd() {
        guard let fullScreenAd = ad else {
            return print("Ad wasn't ready")
        }
        fullScreenAd.present(fromRootViewController: nil)
    }
}
