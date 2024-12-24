import SwiftUI

struct OrtaogretimView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var gKdogruSayisi: Double = 0
    @State private var gKyanlisSayisi: Double = 0
    
    @State private var gYDogruSayisi: Double = 0
    @State private var gYyanlisSayisi: Double = 0
    
    @State private var sonuc: Double = 0
    
    let adCoordinator = AdCoordinator.shared
    @State private var adsManager = AdsManager()
    
    init(){
        adCoordinator.loadAd()
    }
    
    var body: some View {
        VStack {
            Form{
                Section{
                    HStack {
                        Text("✔️ Doğru Sayısı:")
                            .bold()
                        TextField("Doğru sayısını girin", value: $gKdogruSayisi, format: .number)
                            .keyboardType(.numberPad) // Sadece sayıları girebilmek için
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .padding(2)
                            }
                            .sensoryFeedback(.selection, trigger: gKdogruSayisi)
                            
                    HStack {
                                
                        Text("❌ Yanlış Sayısı:")
                                    
                            .bold()
                        TextField("Yanlış sayısını girin", value: $gKyanlisSayisi, format: .number)
                            .keyboardType(.numberPad) // Sadece sayıları girebilmek için
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .padding(2)
                            }
                            .sensoryFeedback(.selection, trigger: gKyanlisSayisi)
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
                        Text("✔️ Doğru Sayısı:")
                            .bold()
                        TextField("Doğru sayısını girin", value: $gYDogruSayisi, format: .number)
                            .keyboardType(.numberPad) // Sadece sayıları girebilmek için
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .padding(2)
                    }
                    .sensoryFeedback(.selection, trigger: gYDogruSayisi)
                    
                    HStack{
                        Text("❌ Yanlış Sayısı:")
                            .bold()
                        TextField("Yanlış sayısını girin", value: $gYyanlisSayisi, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .padding(2)
                    }
                    .sensoryFeedback(.selection, trigger: gYyanlisSayisi)
                }
                header: {
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
                    Text("2022 KPSS Puanı : \(sonuc, specifier: "%.3f")")
                        .transition(.opacity)
                        .animation(.default, value: sonuc)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(4)
                    
                        
                    HesaplaButton(title: "Hesapla"){

                        let gKNet = gKdogruSayisi - (gKyanlisSayisi / 4)
                        let gYNet = gYDogruSayisi - (gYyanlisSayisi / 4)
                        
                        
                        withAnimation{
                            sonuc = Constans.ortaogretimPuan + gYNet * Constans.ortaogretimGYKatsayi + gKNet * Constans.ortaogretimGKKatsayi
                        }
                        // swift data
                        let result = Result(sinavAdi: "2022 Ortaöğretim KPSS",
                                            gyNet: gYNet,
                                            gkNet: gKNet,
                                            sonuc: sonuc)
                        modelContext.insert(result)
                        
                        
                        // Admob
                        adCoordinator.presentAd()
                        
                    }
                    .disabled(formKontrol)
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .fontWeight(.heavy)
                        .padding(.horizontal, 100)
                        .padding(.top, 15)
                        .padding(.bottom, 0)
                }
                
            }
        }
        .navigationTitle("Ortaöğretim")
    }
    var formKontrol: Bool { // her iki test sayı sonuçlarının toplamı 60'ı geçince uyarı veriyoruz.
        if((gYDogruSayisi + gYyanlisSayisi) > 60 || (gKdogruSayisi + gKyanlisSayisi) > 60) {
            return true
        }
        return false
    }
}

#Preview {
    OrtaogretimView()
}
