//
//  InnerCodeFillView.swift
//  CapSwift
//
//  Created by Caroline Ang on 05/09/26.
//

import SwiftUI

struct InnerCodeFillView: View {
    @Binding var userInput: String
    var content: FillLevelContent
    let checkAnswer: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(content.codes.codePrefix).fixedSize(horizontal: false, vertical: true)
            
            TextField(content.codes.codeTeaser, text: $userInput)
                .multilineTextAlignment(.leading)
            
            Text(content.codes.codeSuffix).fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button(action: {checkAnswer()}) {
                    Text("Check Answer")
                        .foregroundStyle(Color(.labelColor))
                }
                .buttonStyle(.glassProminent)
            }
        }
        .fontDesign(.monospaced)
        .padding(16)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
        )
    }
    
}
