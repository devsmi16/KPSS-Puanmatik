import Foundation
import SwiftUI
import Observation

@Observable
class AdsManager { // main view içerisinde 5 kez tıklanma da reklamlar çıkmaya başlayacak
    
    @ObservationIgnored
    @AppStorage("bannerAdCounter") var bannerAdCounter = 0
    
    var interstitialAdCounter = 1
    
    func shouldShowBannerAd() -> Bool {
        return bannerAdCounter >= 5
    }
    
    func shouldShowInterstitialAd() -> Bool {
        return interstitialAdCounter % 5 == 0
    }
    
    func increaseBannerAdCounter(){
        bannerAdCounter += 1
    }
    
    func increaseInterstitialAdCounter(){
        interstitialAdCounter += 1
    }
}
