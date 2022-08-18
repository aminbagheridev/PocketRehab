import SwiftUI

struct GradientTextFieldBackground: TextFieldStyle {
    
    let systemImageString: String
    
    // Hidden function to conform to this protocol
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(LinearGradient(
                        colors: [
                            Color.init(hex: ColorScheme.darkBlue),
                            Color.init(hex: ColorScheme.lightBlue)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    ), lineWidth: 2
                )
                
                .frame(height: 40)
                
                
            
            HStack {
                Image(systemName: systemImageString)
                // Reference the TextField here
                configuration
            }
            .padding(.leading)
            .foregroundColor(.gray)
            .frame(height: 40)
        }
    }
}
