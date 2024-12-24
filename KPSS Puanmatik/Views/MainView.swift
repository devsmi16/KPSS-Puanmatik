import SwiftUI
import GoogleMobileAds

struct MainView: View {
    
    @Binding var selectionTabItem: Int
    @State private var adsManager = AdsManager()

    var width: CGFloat = UIScreen.main.bounds.width
    var size: CGSize {
        return GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(width).size
    }
    
    @State private var showDetail = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        List {
                            Section {
                                
                                createNavigationLink(
                                    destination: OrtaogretimView(),
                                    title: "Ortaöğretim",
                                    subtitle: "P94",
                                    iconColor: .orange,
                                    gradientColors: [.main, .blue]
                                )
                                
                                createNavigationLink(
                                    destination: OnlisansView(),
                                    title: "Önlisans",
                                    subtitle: "P93",
                                    iconColor: .pink,
                                    gradientColors: [.main, .blue]
                                )
                                
                                createNavigationLink(
                                    destination: LisansView(),
                                    title: "Lisans (B Grubu)",
                                    subtitle: "P3",
                                    iconColor: .blue,
                                    gradientColors: [.main, .blue]
                                )
                                
                                createNavigationLink(
                                    destination: EgitimBilimleriView(),
                                    title: "Eğitim Bilimleri",
                                    subtitle: "P10",
                                    iconColor: .green,
                                    gradientColors: [.main, .blue]
                                )
                                
                                createNavigationLink(
                                    destination: OABTView(),
                                    title: "ÖABT",
                                    subtitle: "P121",
                                    iconColor: .purple,
                                    gradientColors: [.main, .blue]
                                )
                            } header: {
                                Text("Bölüm Seçiniz:")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding(.vertical, 8)
                                    .frame(maxWidth: geometry.size.width * 0.5, alignment: .center)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.main.opacity(0.9)]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .shadow(color: Color.black.opacity(0.7), radius: 10, x: 0, y: 4)
                                    )
                                    .textCase(.none)
                                    .padding(.top, geometry.size.height * 0.02)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        .listStyle(InsetGroupedListStyle())
                        
                        if adsManager.shouldShowBannerAd() {
                            if selectionTabItem == 0 {
                                BannerView()
                                    .frame(height: size.height)
                                    .padding(.bottom, geometry.size.height * 0.02)
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack(spacing: 4) {
                            HStack(spacing: 6) {
                                Image(systemName: "chart.bar.xaxis")
                                    .font(.system(size: geometry.size.width * 0.05))
                                    .foregroundColor(Color.blue.opacity(0.4))
                                    .shadow(color: Color.blue.opacity(0.5), radius: 2, x: 0, y: 2)
                                
                                Text("KPSS Puan Hesaplama")
                                    .font(.system(size: geometry.size.width * 0.05, weight: .medium, design: .rounded))
                                    .foregroundColor(Color.main)
                                    .fontWeight(.bold)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 3)
                            )
                            
                            Rectangle()
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [Color.main, Color.blue]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                                .frame(height: 7)
                                .cornerRadius(4)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .navigationTitle("KPSS Puan Hesaplama")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    /// Dinamik NavigationLink oluşturucu
    func createNavigationLink(
        destination: some View,
        title: String,
        subtitle: String,
        iconColor: Color,
        gradientColors: [Color]
    ) -> some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: "book.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Circle().fill(iconColor))
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(subtitle)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 1)
                        .padding(.horizontal, 4)
                        .background(
                            LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 1)
                        .overlay(
                            Capsule().stroke(Color.blue, lineWidth: 2)
                        )
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 18, weight: .bold))
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3))
        }
    }
}

#Preview {
    MainView(selectionTabItem: .constant(0))
}
