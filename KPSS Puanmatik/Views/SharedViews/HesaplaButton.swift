import SwiftUI

struct HesaplaButton: View {
    
    @State private var isScaled = true
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        })
        {
            Label(title, systemImage: "plus.slash.minus")
                .font(.title)
                .foregroundStyle(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.horizontal, 10)
            
        }.buttonStyle(.borderedProminent)
         .tint(.main)
        }
        
    }

#Preview {
    HesaplaButton(title: "Hesapla"){

    }
}
