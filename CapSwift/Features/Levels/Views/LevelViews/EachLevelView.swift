//
//  EachLevelView.swift
//  CapSwift
//
//  Created by Caroline Ang on 05/09/26.
//

import SwiftUI

struct EachLevelView: View {
    @Binding var tab: Int
    @Bindable var viewModel: LevelViewModel
    
    private var level: LevelData? {
        viewModel.getLevelData(id: tab)
    }
    
    private var question: QuestionContent? {
        viewModel.getQuestionContent(id: tab)
    }
    
    var body: some View {
        if let level = level, let question = question {
            switch question {
            case .block(let block):
                BlockLevelView(tab: $tab, level: level.content, question: block, viewModel: viewModel)
            case .fill(let fill):
                FillLevelView(tab: $tab, level: level.content, question: fill, viewModel: viewModel)
            }
        }
        else {
            Text("New Levels Coming Soon!")
                .padding(16)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    EachLevelView(tab: .constant(0), viewModel: LevelViewModel())
}
