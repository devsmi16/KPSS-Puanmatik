import Foundation
import UIKit

protocol BannerViewControllerWithDelegate: AnyObject {
    func bannerViewController(_ bannerViewController: BannerViewController, didUpdateWidth width: CGFloat)
}

class BannerViewController: UIViewController {
    weak var delegate: BannerViewControllerWithDelegate?
    private var lastReportedWidth: CGFloat = 0

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        reportWidthIfNeeded()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil) { _ in
            self.reportWidthIfNeeded()
        }
    }

    private func reportWidthIfNeeded() {
        let currentWidth = view.frame.inset(by: view.safeAreaInsets).size.width
        if currentWidth != lastReportedWidth {
            lastReportedWidth = currentWidth
            delegate?.bannerViewController(self, didUpdateWidth: currentWidth)
        }
    }
}
