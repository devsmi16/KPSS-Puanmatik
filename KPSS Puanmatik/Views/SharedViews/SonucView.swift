import SwiftUI

struct SonucView: View {
    
    let sonuc2022 : Double
    let sonucEB2022 : Double
    let sonucOABT2022 : Double?
    
    let sonuc2023 : Double
    let sonucEB2023 : Double
    let sonucOABT2023 : Double?
    
    var body: some View {
        
        NavigationStack {
            VStack {
            
                List{
                    Section{
                        
                        Text("2023 P3 (Memur) : \(sonuc2023, specifier: "%.3f")")
                            .transition(.opacity)
                            .animation(.default, value: sonuc2023)
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(5)
                        
                        Text("2023 P10 (Öğretmen) : \(sonucEB2023, specifier: "%.3f")")
                            .transition(.opacity)
                            .animation(.default, value: sonuc2023)
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(5)
                        
                        if sonucOABT2023 != nil {
                            Text("2023 P121 (Alan) : \(sonucOABT2023 ?? 0, specifier: "%.3f")")
                                .transition(.opacity)
                                .animation(.default, value: sonucOABT2023)
                                .font(.headline)
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(5)
                        }
                        
                    }header: {
                        Text("2023 KPSS")
                            .bold()
                            .foregroundStyle(.main)
                            .font(.headline)
                            .fontWeight(.regular)
                            .baselineOffset(10)
                    }
                    
                    
                    
                    Section{
                        
                        Text("2022 P3 (Memur) : \(sonuc2022, specifier: "%.3f")")
                            .transition(.opacity)
                            .animation(.default, value: sonuc2022)
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(5)
                        
                        Text("2022 P10 (Öğretmen) : \(sonucEB2022, specifier: "%.3f")")
                            .transition(.opacity)
                            .animation(.default, value: sonuc2022)
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(5)
                        
                        if sonucOABT2022 != nil {
                            Text("2022 P121 (Alan) : \(sonucOABT2022 ?? 0, specifier: "%.3f")")
                                .transition(.opacity)
                                .animation(.default, value: sonucOABT2022)
                                .font(.headline)
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(5)
                        }
                        
                    }header: {
                        Text("2022 KPSS")
                            .bold()
                            .foregroundStyle(.main)
                            .font(.headline)
                            .baselineOffset(10)
                    }
                }
            }
        }
        .navigationTitle("Sonuç")
    }
}

#Preview{
    SonucView(sonuc2022: 0,
              sonucEB2022: 0,
              sonucOABT2022: 0,
              sonuc2023: 0,
              sonucEB2023: 0,
              sonucOABT2023: 0)
}
