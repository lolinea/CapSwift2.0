//
//  RightFillView.swift
//  CapSwift
//
//  Created by Caroline Ang on 08/09/26.
//

import SwiftUI

struct RightFillView: View {
    let level: LevelContent
    let question: FillLevelContent
    @Bindable var viewModel: LevelViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            VStack (alignment: .leading) {
                Text(viewModel.userInput)
            }
            .padding(.bottom, 20)
        }
        .padding(16)
        .frame(minWidth: 450, maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.thinMaterial)
        .cornerRadius(20)
        .padding(16)
        .padding(.leading)
    }
    
}
