//
//  InnerCodeBlockView.swift
//  CapSwift
//
//  Created by Caroline Ang on 08/09/26.
//

import SwiftUI

struct InnerCodeBlockView: View {
    @Binding var tab: Int
    @Bindable var viewModel: LevelViewModel
    var content: BlockLevelContent
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Code Preview")
                .font(.title2.bold())
            
            VStack (alignment: .leading, spacing: 12){
                Text(content.codePrefix).fixedSize(horizontal: false, vertical: true)
                
                if (viewModel.userInput == "") {
                    Text("Answers will be shown here")
                        .foregroundStyle(.secondary)
                        .padding(8)
                } else {
                    Text(viewModel.userInput)
                        .multilineTextAlignment(.leading)
                        .padding(8)
                        .background(Color(.white).opacity(0.2))
                        .cornerRadius(4)
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
    
}


