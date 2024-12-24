import SwiftUI
import AppTrackingTransparency
import UIOnboarding

struct RootView: View {
    @AppStorage("showingOnboarding") private var showingOnboarding = true
    @State private var selectionItem = 0
    @State private var adsManager = AdsManager()
    var body: some View {
        TabView(selection: $selectionItem){
            MainView(selectionTabItem: $selectionItem)
                .tabItem{
                    Label("Ana Sayfa", systemImage: "house")
                        .environment(\.symbolVariants, selectionItem == 0 ? .fill: .none)
                }
                .tag(0)
            ResultView(selectionTabItem: $selectionItem)
                .tabItem{
                    Label("Hesaplamalar", systemImage: "arrow.counterclockwise.circle")
                        .environment(\.symbolVariants, selectionItem == 1 ? .fill: .none)
                }
                .tag(1)
        }
        .fullScreenCover(isPresented: $showingOnboarding, content: { // karşılama ekranından sonra reklam kişiselleştirme iznini soracak
            OnboardingView.init()
                .edgesIgnoringSafeArea(.all)
                .onDisappear{
                    showingOnboarding = false
                    ATTrackingManager.requestTrackingAuthorization(completionHandler:{status in})
                    
                }    
        })
        .onAppear(){
            adsManager.increaseBannerAdCounter() // bu metod uygulama açıldığında bir kere çalışacak ve reklam değerinin değişkenini bir defa artıracak
        }
        .tint(.main)
    }
}
#Preview {
    RootView()
}
