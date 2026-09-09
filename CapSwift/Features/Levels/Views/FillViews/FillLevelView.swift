//
//  FillLevelView.swift
//  CapSwift
//
//  Created by Caroline Ang on 08/09/26.
//

import SwiftUI

struct FillLevelView: View {
    @Binding var tab: Int
    var level: LevelContent
    var question: FillLevelContent
    @Bindable var viewModel: LevelViewModel
    
    var body: some View {
        HStack (alignment: .center) {
            LeftFillView(level: level, question: question, viewModel: viewModel)
            RightFillView(level: level, question: question, viewModel: viewModel)
        }
        .padding(16)
        .onChange(of: tab) {
            viewModel.userInput = ""
            viewModel.resultStatus = ""
            viewModel.resultBool = false
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
