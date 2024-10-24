//
//  RoundButton.swift
//  GreenCart
//
//  Created by Zain Malik on 16/10/2024.
//

import SwiftUI

struct RoundButton: View {
    @State var title = "Title"
    var didTap: (() -> ())?
    
    var body: some View {
        Button{
            didTap?()
        }label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color.primaryApp)
        .cornerRadius(30)
    }
}

#Preview {
    RoundButton()
}
