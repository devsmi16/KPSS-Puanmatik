import SwiftUI


struct EgitimBilimleriView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var gKdogruSayisi: Double = 0
    @State private var gKyanlisSayisi: Double = 0
    
    @State private var gYDogruSayisi: Double = 0
    @State private var gYyanlisSayisi: Double = 0
    
    @State private var eBDogruSayisi: Double = 0
    @State private var eByanlisSayisi: Double = 0
    
    @State private var sonuc2022: Double = 0
    @State private var sonucEB2022: Double = 0
    @State private var sonuc2023: Double = 0
    @State private var sonucEB2023: Double = 0
    
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
                
                // ----
                Section{
                    HStack{
                        Text("✔️ Doğru Sayısı:")
                            .bold()
                        
                        TextField("Doğru sayısını girin", value: $eBDogruSayisi, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .padding(2)
                    }
                    
                    HStack{
                        Text("❌ Yanlış Sayısı:")
                            .bold()
                        
                        TextField("Yanlış sayısını girin", value: $eByanlisSayisi, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .padding(2)
                    }
                }header: {
                    Text("Eğitim Bilimleri")
                        .bold()
                        .textCase(.none)
                }footer: {
                    if(eBDogruSayisi + eByanlisSayisi > 80){
                        Text("Toplam doğru ve yanlış sayısı 80'i geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                //----
                Section{
                    HStack{
                        Text("✔️ Doğru Sayısı:")
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
                    VStack(alignment: .leading) {
                        Text("2023 P3 (Memur) : \(sonuc2023, specifier: "%.3f")")
                            .transition(.opacity)
                            .animation(.default, value: sonuc2023)
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(5)
                            .font(.caption)
                        
                        Text("2023 P310 (Öğretmen) : \(sonucEB2023, specifier: "%.3f")")
                            .transition(.opacity)
                            .animation(.default, value: sonuc2023)
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(5)
                            .font(.caption)
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text("2022 P3 (Memur) : \(sonuc2022, specifier: "%.3f")")
                            .transition(.opacity)
                            .animation(.default, value: sonuc2022)
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(5)
                            .font(.caption)
                        
                        Text("2022 P10 (Öğretmen) : \(sonucEB2022, specifier: "%.3f")")
                            .transition(.opacity)
                            .animation(.default, value: sonuc2022)
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(5)
                    }
                    
                    
                    HesaplaButton(title: "Hesapla"){

                        let gKNet = gKdogruSayisi - (gKyanlisSayisi / 4)
                        let gYNet = gYDogruSayisi - (gYyanlisSayisi / 4)
                        let eBNet = eBDogruSayisi - (eByanlisSayisi / 4)
                        
                        sonucEB2022 = 36.812 + gYNet * 0.3985 + gKNet * 0.3512 + eBNet * 0.34714
                        sonuc2022 = 48.616 + gYNet * 0.4756 + gKNet * 0.4192
                        
                        sonucEB2023 = 40.405 + gYNet * 0.3493 + gKNet * 0.3672 + eBNet * 0.37145
                        sonuc2023 = 51.209 + gYNet * 0.537 + gKNet * 0.418
                        
                        
                        withAnimation {
                            sonuc2023 = Constans.lisans2023Puan + gYNet * Constans.lisans2023GYKatsayi + gKNet * Constans.lisans2023GKKatsayi
                            sonuc2022 = Constans.lisans2022Puan + gYNet * Constans.lisans2022GYKatsayi + gKNet * Constans.lisans2022GKKatsayi
                        }
                        
                        // swift data
                        _ = Result(sinavAdi: "2023 Lisans KPSS", gyNet: gYNet, gkNet: gKNet, sonuc: sonuc2023)
                        
                        _ = Result(sinavAdi: "2022 Lisans KPSS", gyNet: gYNet, gkNet: gKNet, sonuc: sonuc2022)
                        
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
                        .padding(.bottom, 1)
                }
                
            }
        }
        .navigationTitle("Eğitim Bilimleri")
    }
    var formKontrol: Bool { // her iki test sayı sonuçlarının toplamı 60'ı geçince uyarı veriyoruz.
        if((gYDogruSayisi + gYyanlisSayisi) > 60 || (gKdogruSayisi + gKyanlisSayisi) > 60 || (eBDogruSayisi + eByanlisSayisi > 80)) {
            return true
        }
        return false
    }
}

#Preview {
    EgitimBilimleriView()
}
