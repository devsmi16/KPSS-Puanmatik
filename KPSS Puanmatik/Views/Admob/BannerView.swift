import SwiftUI
import GoogleMobileAds

struct BannerView: UIViewControllerRepresentable {
    @State private var viewWidth: CGFloat = .zero
    private let bannerView = GADBannerView()
    private let adUnitId = "ca-app-pub-2668993362842600/9937494991"

    func makeUIViewController(context: Context) -> BannerViewController {
        let bannerViewController = BannerViewController()
        bannerViewController.delegate = context.coordinator

        bannerView.adUnitID = adUnitId
        bannerView.rootViewController = bannerViewController
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerViewController.view.addSubview(bannerView)

        NSLayoutConstraint.activate([
            bannerView.bottomAnchor.constraint(equalTo: bannerViewController.view.safeAreaLayoutGuide.bottomAnchor),
            bannerView.centerXAnchor.constraint(equalTo: bannerViewController.view.centerXAnchor)
        ])

        return bannerViewController
    }

    func updateUIViewController(_ uiViewController: BannerViewController, context: Context) {
        guard viewWidth != .zero else { return }
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        bannerView.load(GADRequest())
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, BannerViewControllerWithDelegate, GADBannerViewDelegate {
        let parent: BannerView

        init(_ parent: BannerView) {
            self.parent = parent
        }

        // MARK: - BannerViewControllerWithDelegate methods
        func bannerViewController(_ bannerViewController: BannerViewController, didUpdateWidth width: CGFloat) {
            parent.viewWidth = width
        }

        // MARK: - GADBannerViewDelegate methods
        func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
            print("Banner ad did receive.")
        }

        func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
            print("Failed to load banner ad: \(error.localizedDescription)")
        }

        func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
            print("Banner ad will present screen.")
        }

        func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
            print("Banner ad will dismiss screen.")
        }

        func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
            print("Banner ad did dismiss screen.")
        }
    }
}
