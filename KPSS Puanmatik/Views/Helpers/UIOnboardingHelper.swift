import Foundation
import UIKit
import UIOnboarding

struct UIOnboardingHelper {

    static func setUpIcon() -> UIImage {
        return Bundle.main.appIcon ?? .init(named: "onboarding-icon")!
    }

    static func setUpFirstTitleLine() -> NSMutableAttributedString {
        .init(string: "KPSS", attributes: [.foregroundColor: UIColor.label])
    }

    static func setUpSecondTitleLine() -> NSMutableAttributedString {
        .init(string: Bundle.main.displayName ?? "Puan Hesaplama", attributes: [
            .foregroundColor: UIColor.main
        ])
    }
    
    static func setUpFeatures() -> Array<UIOnboardingFeature> {
        return .init([
            .init(icon: .init(named: "lise")!,
                  title: "B Grubu Memurluk",
                  description: "Lisans, Önlisans ve Ortaöğretim mezunu olup memurluk için hazırlananlar."),
            .init(icon: .init(named: "lisans")!,
                  title: "Eğitim Bilimleri",
                  description: "Sadece Eğitim Bilimlerinden sorumlu olup, ÖABT girmeyecek adaylar."),
            .init(icon: .init(named: "oabt")!,
                  title: "Öğretmenlik Alan Bilgisi",
                  description: "Öğretmenlik (P121) için sınava hazırlanan adaylar."),
            .init(icon: .init(named: "calculate")!,
                  title: "Geçmiş Hesaplamalar",
                  description: "Daha önceki yaptığınız hesaplamalara ulaşabiliyorsunuz.")
        ])
    }
    
    static func setUpNotice() -> UIOnboardingTextViewConfiguration {
        return .init(icon: .init(named: "onboarding-notice-icon")!,
                     text: "Geçmiş yılların istatistikleri kullanarak hazırlanmıştır.",
                     tint: .main)
    }
    static func setUpButton() -> UIOnboardingButtonConfiguration {
        return .init(title: "Devam Et",
                     titleColor: .white,
                     backgroundColor: .main)
    }
}

extension UIOnboardingViewConfiguration {
    static func setUp() -> UIOnboardingViewConfiguration {
        return .init(appIcon: UIOnboardingHelper.setUpIcon(),
                     firstTitleLine: UIOnboardingHelper.setUpFirstTitleLine(),
                     secondTitleLine: UIOnboardingHelper.setUpSecondTitleLine(),
                     features: UIOnboardingHelper.setUpFeatures(),
                     textViewConfiguration: UIOnboardingHelper.setUpNotice(),
                     buttonConfiguration: UIOnboardingHelper.setUpButton())
    }
}
