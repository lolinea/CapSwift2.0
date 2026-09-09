//
//  BlockLevelView.swift
//  CapSwift
//
//  Created by Caroline Ang on 08/09/26.
//

import SwiftUI

struct BlockLevelView: View {
    @Binding var tab: Int
    var level: LevelContent
    var question: BlockLevelContent
    @Bindable var viewModel: LevelViewModel
    
    var body: some View {
        HStack (alignment: .center, spacing: 20) {
            LeftBlockView(tab: $tab, level: level, question: question, viewModel: viewModel)
            RightBlockView(tab: $tab, level: level, question: question, viewModel: viewModel)
        }
        .padding(16)
        .onChange(of: tab) {
            viewModel.setupBlockLevel(id: tab)
            viewModel.resultImage = question.solution.initImage
        }
        .onAppear {
            viewModel.setupBlockLevel(id: tab)
            viewModel.resultImage = question.solution.initImage
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
