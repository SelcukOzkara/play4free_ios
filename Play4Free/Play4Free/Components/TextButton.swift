//
//  TextButton.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 30.01.24.
//

import SwiftUI

struct TextButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .tint(.orange)
        }
        .frame(width: 200)
    }
    
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(title: "Anmelden") { }
    }
}
