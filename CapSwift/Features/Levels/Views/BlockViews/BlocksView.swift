//
//  BlocksView.swift
//  CapSwift
//
//  Created by Caroline Ang on 09/09/26.
//

import SwiftUI

struct BlocksView: View {
    @Bindable var viewModel: LevelViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            VStack (alignment: .leading) {
                HStack {
                    ForEach(viewModel.placedBlockAnswers.indices, id:\.self) { index in
                        Text(viewModel.placedBlockAnswers[index] ?? "\t\t\t\t")
                            .padding(16)
                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                            )
                            .dropDestination(for: String.self) { items, _ in
                                guard let answer = items.first else { return }
                                viewModel.placeAnswer(answer: answer, at: index)
                                return
                            }
                            .onTapGesture {
                                viewModel.removeAnswer(at: index)
                            }
                    }
                }
                Text("Drag Your Answers Here")
                    .font(.body.bold())
            }
            .padding(.bottom, 16)
            
            HStack {
                ForEach(viewModel.availableAnswers, id:\.self) { answer in
                    Text(answer)
                        .font(.callout)
                        .padding(16)
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                        )
                        .draggable(answer)
                }
            }
            
        }
        .padding(16)
        .frame(minWidth: 450, maxWidth: .infinity, alignment: .topLeading)
        .background(.thinMaterial)
        .cornerRadius(20)
    }
    
}
