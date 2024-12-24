import SwiftUI


struct OABTView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var gKdogruSayisi: Double = 0
    @State private var gKyanlisSayisi: Double = 0
    
    @State private var gYDogruSayisi: Double = 0
    @State private var gYyanlisSayisi: Double = 0
    
    @State private var eBDogruSayisi: Double = 0
    @State private var eByanlisSayisi: Double = 0
    
    @State private var oabtDogruSayisi: Double = 0
    @State private var oabtYanlisSayisi: Double = 0
    
    @State private var sonuc2022: Double = 0
    @State private var sonucEB2022: Double = 0
    @State private var sonucOABT2022: Double = 0
    
    @State private var sonuc2023: Double = 0
    @State private var sonucEB2023: Double = 0
    @State private var sonucOABT2023: Double = 0
    
    @State private var isShowingSheet = false
    @State private var oabtKatSayi = 0.4334
    @State private var oabtPuan    = 43.805
    
    @State private var selectOption = 0
        let options = [
            (0.4334, 43.805, "Beden Eğitimi"),
            (0.3666, 41.071, "Biyoloji"),
            (0.4301, 39.060, "Coğrafya"),
            (0.4052, 34.908, "Din Kültürü"),
            (0.3679, 42.156, "Edebiyat"),
            (0.5388, 39.313, "Fen Bilgisi"),
            (0.3817, 41.604, "Fizik"),
            (0.5225, 36.309, "İlköğretim Matematik"),
            (0.3883, 37.962, "İmam Hatip Meslek Dersleri Ö."),
            (0.3791, 40.920, "İngilizce"),
            (0.4542, 42.157, "Kimya"),
            (0.4247, 41.759, "Lise Matematik"),
            (0.4944, 33.292, "Okul Öncesi"),
            (0.4883, 29.014, "Rehberlik"),
            (0.6184, 33.598, "Sınıf Öğretmenliği"),
            (0.6142, 34.101, "Sosyal Bilgiler"),
            (0.3521, 41.418, "Tarih"),
            (0.4565, 34.329, "Türkçe")
        ]
    
    
    let adCoordinator = AdCoordinator()
    
    init(){
        adCoordinator.loadAd()
    }
    
    var body: some View {
        VStack {
            Form{
                Section{
                    HStack{
                        Label("Doğru Sayısı:", systemImage:"checkmark.circle.fill")
                        TextField("Doğru sayısını girin.",value: $gKdogruSayisi, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 100)
                    }
                    .bold()
                    
                    HStack{
                        Label("Yanlış Sayısı:", systemImage: "xmark.circle.fill")
                        TextField("Yanlış sayısını girin", value: $gKyanlisSayisi, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 100)
                    }
                    .bold()

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
                        Label("Doğru Sayısı: ", systemImage: "checkmark.circle.fill")
                        TextField("Doğru sayısını girin.", value: $eBDogruSayisi, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 100)
                    }
                    .bold()
                    
                    HStack{
                        Label("Yanlış Sayısı: ", systemImage: "xmark.circle.fill")
                        TextField("Yanlış sayısını girin.", value: $eByanlisSayisi, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 100)
                    }
                    .bold()
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
                
                
                Section{
                    Picker("Bölüm Seçiniz", selection: $selectOption) {
                        ForEach(0..<options.count, id: \.self){ index in
                            HStack{
                                Image(systemName: "book.closed.fill")
                                Text(options[index].2)
                            }
                            
                        }
                    }
                    .onChange(of: selectOption) {
                        oabtKatSayi = options[selectOption].0
                        oabtPuan = options[selectOption].1
                    }
                    
                    HStack{
                        Label("Doğru Sayısı: ", systemImage: "checkmark.circle.fill")
                        TextField("Doğru sayısını girin.", value: $oabtDogruSayisi, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 100)
                    }
                    .bold()
                    
                    HStack{
                        Label("Yanlış Sayısı: ", systemImage: "xmark.circle.fill")
                        TextField("Yanlış sayısını girin.", value: $oabtYanlisSayisi, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 100)
                    }
                    .bold()

                }header: {
                    Text("ÖABT")
                        .bold()
                        .textCase(.none)
                }footer: {
                    if(eBDogruSayisi + eByanlisSayisi > 75){
                        Text("Toplam doğru ve yanlış sayısı 75'i geçemez.")
                            .foregroundStyle(.red)
                    }
                }

                Section{
                    HStack{
                        Label("Doğru Sayısı:", systemImage: "checkmark.circle.fill")
                        TextField("Doğru sayısını girin", value: $gYDogruSayisi, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 100)
                    }
                    .bold()
                    
                    HStack{
                        Label("Yanlış Sayısı:", systemImage: "xmark.circle.fill")
                        TextField("Yanlış sayısını girin", value: $gYyanlisSayisi, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 100)
                    }
                    .bold()

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
                        
                        Text("2022 P121 (Alan) : \(sonucOABT2022, specifier: "%.3f")")
                            .transition(.opacity)
                            .animation(.default, value: sonucOABT2022)
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
                        let oabtNet = oabtDogruSayisi - (oabtYanlisSayisi / 4)
                        
                        sonucEB2022 = 36.812 + gYNet * 0.3985 + gKNet * 0.3512 + eBNet * 0.34714
                        sonuc2022 = 48.616 + gYNet * 0.4756 + gKNet * 0.4192
                        sonucOABT2022 = oabtPuan + gYNet * 0.1720 + gKNet * 0.1515 + eBNet * 0.1498 + oabtNet * oabtKatSayi
                        
                        sonucEB2023 = 40.405 + gYNet * 0.3493 + gKNet * 0.3672 + eBNet * 0.37145
                        sonuc2023 = 51.209 + gYNet * 0.537 + gKNet * 0.418
                        
                        withAnimation{
                            sonuc2022 = Constans.lisans2022Puan + gYNet * Constans.lisans2022GYKatsayi + gKNet * Constans.lisans2022GKKatsayi
                            sonucEB2022 = Constans.eb2022Puan + gYNet * Constans.eb2022GYKatsayi + gKNet * Constans.eb2022GKKatsayi + eBNet * Constans.eb2022Katsayi
                            sonucOABT2022 = oabtPuan + gYNet * Constans.oabt2022GYKatsayi + gKNet * Constans.oabt2022GKKatsayi + eBNet * Constans.oabt2022EBKatsayi + oabtNet * oabtKatSayi
                            sonuc2023 = Constans.lisans2023Puan + gYNet * Constans.lisans2023GYKatsayi + gKNet * Constans.lisans2023GKKatsayi
                            sonucEB2023 = Constans.eb2023Puan + gYNet * Constans.eb2023GYKatsayi + gKNet * Constans.eb2023GKKatsayi + eBNet * Constans.eb2023Katsayi
                        }
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
        .navigationTitle("ÖABT")
    }
    var formKontrol: Bool { // her iki test sayı sonuçlarının toplamı 60'ı geçince uyarı veriyoruz.
        if((gYDogruSayisi + gYyanlisSayisi) > 60 || (gKdogruSayisi + gKyanlisSayisi) > 60 || (eBDogruSayisi + eByanlisSayisi > 80 || (oabtDogruSayisi + oabtYanlisSayisi) > 75)) {
            return true
        }
        return false
    }
}
#Preview {
    OABTView()
}
