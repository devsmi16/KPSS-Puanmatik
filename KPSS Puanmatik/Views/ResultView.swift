import SwiftUI
import SwiftData
import Lottie

struct ResultView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Result.id, order: .reverse) private var results: [Result] // filtreleme işlemi
    @Binding var selectionTabItem: Int
    
    var body: some View {
        NavigationStack {
            VStack{
                List{
                    ForEach(results) { result in
                        VStack(alignment: .leading){
                            Text(result.sinavAdi)
                                .bold()
                                .font(.headline)
                            
                            HStack{
                                HStack(alignment: .top){
                                    Text("Genel Yetenek:")
                                    Text(result.gyNet.formatted())
                                }
                                Spacer()
                                HStack(alignment: .top){
                                    Text("ÖABT:")
                                    Text((result.oabtNet ?? 0).formatted())
                                }
                            }
                            
                            HStack{
                                HStack{
                                    Text("Genel Kültür:")
                                    Text(result.gkNet.formatted())
                                }
                                Spacer()
                                HStack{
                                    Text("Eğitim Bilimleri:")
                                    Text((result.ebNet ?? 0).formatted())
                                }
                            }
                            HStack {
                                Text("Puan:")
                                Text(result.sonuc.formatted())
                                    .bold()
                                    .italic()
                                    .foregroundStyle(Color.blue)
                                    .foregroundColor(.blue)
                            }
                            HStack {
                                Spacer()
                                Text(result.tarih.formatted(date: .numeric, time: .standard))
                                    .italic()
                                    .font(.footnote)
                            }
                        }
                    }
                    .onDelete { IndexSet in // kayıt altına alınmış index'leri silme işlemi
                        for index in IndexSet {
                            modelContext.delete(results[index])
                        }
                    }
                    
                }
                .overlay{
                    GeometryReader { geo in
                        
                        if results.isEmpty {
                            ContentUnavailableView {
                                VStack(spacing: 30) {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.gray)
                                    
                                    Text("Sonuç Bulunamadı.")
                                        .font(.body)
                                        .fontWeight(.light)
                                        .foregroundColor(.main)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                            }description: {
                                Text("Daha önce yaptğınız hesaplamalar burada görünür.")
                                    .italic()
                                
                                LottieView(animation: .named("notfound"))
                                    .looping()
                                    .frame(height: geo.size.height * 0.2)
                                    .shadow(radius: 30)
                                
                            }actions: {
                                Button("Puan hesaplaması yap :)"){ // buraya tıklandığında bizi ana sayfadaki bölüme atsın
                                    selectionTabItem = 0
                                }
                                .bold()
                                .padding()
                                .font(.headline)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Hesaplamalar")
    }
}

#Preview {
    ResultView(selectionTabItem: .constant(1))
}
