import SwiftUI

struct LisansView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var gKdogruSayisi: Double = 0
    @State private var gKyanlisSayisi: Double = 0
    
    @State private var gYDogruSayisi: Double = 0
    @State private var gYyanlisSayisi: Double = 0
    
    @State private var sonuc2022: Double = 0
    @State private var sonuc2023: Double = 0
    
    let adCoordinator = AdCoordinator.shared
    
    init(){
        adCoordinator.loadAd()
    }
    
    var body: some View {
        VStack {
            Form{
                Section{
                    HStack{
                        Text("✔️ Doğru Sayısı:")
                            .bold()
                        
                        TextField("Doğru sayısını girin", value: $gKdogruSayisi, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .padding(2)
                    }
                    .sensoryFeedback(.selection, trigger: gKdogruSayisi)
                    
                    HStack{
                        Text("❌ Yanlış Sayısı:")
                            .bold()
                        
                        TextField("Yanlış sayısını girin", value: $gKyanlisSayisi, format: .number)
                                   
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .padding(2)
                    }

                }header: {
                    Text("Genel Kültür")
                        .bold()
                        .textCase(.none)
                }footer: {
                    if(gKdogruSayisi + gKyanlisSayisi > 60){
                        Text("Toplam doğru ve yanlış sayısı 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section{
                    HStack{
                        Text("✔️Doğru Sayısı:")
                            .bold()
                        
                        TextField("Doğru sayısını girin", value: $gYDogruSayisi, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .padding(2)
                    }
                    
                    HStack{
                        Text("❌ Yanlış Sayısı:")
                            .bold()
                        
                        TextField("Yanlış sayısını girin", value: $gYyanlisSayisi, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .padding(2)
                    }
                }header: {
                    Text("Genel Yenetek")
                        .bold()
                        .textCase(.none)
                }footer: {
                    if(gYDogruSayisi + gYyanlisSayisi > 60){
                        Text("Toplam doğru ve yanlış sayısı 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section{
                    Text("2023 KPSS Puanı : \(sonuc2023, specifier: "%.3f")")
                        .transition(.opacity)
                        .font(.headline)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(5)
                        .font(.caption)
                    
                    Text("2022 KPSS Puanı : \(sonuc2022, specifier: "%.3f")")
                        .transition(.opacity)
                        .font(.headline)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(5)
                        .font(.caption)
                    
                    HesaplaButton(title: "Hesapla"){

                        let gKNet = gKdogruSayisi - (gKyanlisSayisi / 4)
                        let gYNet = gYDogruSayisi - (gYyanlisSayisi / 4)
                       
                        withAnimation {
                            sonuc2023 = Constans.lisans2023Puan + gYNet * Constans.lisans2023GYKatsayi + gKNet * Constans.lisans2023GKKatsayi
                            sonuc2022 = Constans.lisans2022Puan + gYNet * Constans.lisans2022GYKatsayi + gKNet * Constans.lisans2022GKKatsayi
                        }
                        
                        // Swift Data
                        let result2023 = Result(sinavAdi: "2023 Lisans KPSS", gyNet: gYNet, gkNet: gKNet, sonuc: sonuc2023)
                        let result2022 = Result(sinavAdi: "2022 Lisans KPSS", gyNet: gYNet, gkNet: gKNet, sonuc: sonuc2022)
                        
                        modelContext.insert(result2023)
                        modelContext.insert(result2022)
                        
                        // admob
                        
                        adCoordinator.presentAd()
                        
                    }
                    .disabled(formKontrol)
                    .sensoryFeedback(.success, trigger: sonuc2022)
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.horizontal, 100)
                        .padding(.top, 15)
                        .padding(.bottom, 0)
                }
                
            }
        }
        .navigationTitle("Lisans (B Grubu)")
    }
    var formKontrol: Bool { // her iki test sayı sonuçlarının toplamı 60'ı geçince uyarı veriyoruz.
        if((gYDogruSayisi + gYyanlisSayisi) > 60 || (gKdogruSayisi + gKyanlisSayisi) > 60) {
            return true
        }
        return false
    }
}

#Preview {
    LisansView()
}
