//
//  TabButton.swift
//  GreenCart
//
//  Created by Zain Malik on 23/10/2024.
//

import SwiftUI

struct TabButton: View {
    @State var title: String = "Title"
    @State var icon: String = "store_tab"
    var isSelect: Bool = false
    var didSelect: () -> ()
    
    var body: some View {
        Button {
            debugPrint("Tab Button Tap")
            didSelect()
        } label: {
            VStack(spacing: 8) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: isSelect ? 28: 25, height: isSelect ? 28 : 25) // Animates the icon size on selection
                    .foregroundColor(isSelect ? .primaryApp : .primaryText)
                    .scaleEffect(isSelect ? 1.1 : 1.0) // Scale effect for selected tab
                    .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.4), value: isSelect) // Spring animation
                
                Text(title)
                    .font(isSelect ? .customfont(.semibold, fontSize: 14): .customfont(.regular, fontSize: 14) )
                    .foregroundColor(isSelect ? .primaryApp : .primaryText)
                    .scaleEffect(isSelect ? 1.1 : 1.0) // Animates the text size on selection
                    .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.4), value: isSelect)
            }
            .padding(.vertical, 5)
//            .background(
//                RoundedRectangle(cornerRadius: 12) // Rounded rectangle with corner radius
//                    .fill(isSelect ? Color.primaryApp.opacity(0.15) : Color.clear)
//                    .shadow(color: isSelect ? Color.primaryApp.opacity(0.3) : Color.clear, radius: 5, x: 0, y: 4) // Adding shadow for depth
//                    .animation(.easeInOut, value: isSelect) // Smooth animation
//            )
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}


#Preview {
    TabButton {
        print("Did select")
    }
}
