//
//  LeftFillView.swift
//  CapSwift
//
//  Created by Caroline Ang on 08/09/26.
//

import SwiftUI

struct LeftFillView: View {
    let level: LevelContent
    let question: FillLevelContent
    @Bindable var viewModel: LevelViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 12){
            VStack (alignment: .leading) {
                Text(level.header)
                    .font(.title.bold())
                    .padding(.bottom, 5)
                Text(level.instruction)
                    .font(.body)
                    .foregroundStyle(Color.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Divider()
            
            VStack (alignment: .leading) {
                Text("Guide to Array Collection Type")
                    .font(.title3.bold())
                
                VStack(alignment: .leading) {
                    ForEach(viewModel.guide, id: \.id) { guide in
                        ShowGuideView(content: guide.content)
                    }
                }
            }
            
            Divider()
            
            InnerCodeFillView(userInput: $viewModel.userInput, content: question, checkAnswer: {})
        }
        .padding(16)
        .background(.thinMaterial)
        .cornerRadius(20)
        .frame(minWidth: 450, maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.trailing)
        .padding(16)
        
    }
}
