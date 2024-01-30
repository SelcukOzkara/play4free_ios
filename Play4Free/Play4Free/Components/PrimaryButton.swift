//
//  PrimaryButton.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 30.01.24.
//

import SwiftUI

struct PrimaryButton: View {
    
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
        }
        .padding(.vertical, 12)
        .background(Color.orange)
        .cornerRadius(12)
        .frame(width: 200)
    }
    
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Login") { }
    }
}
