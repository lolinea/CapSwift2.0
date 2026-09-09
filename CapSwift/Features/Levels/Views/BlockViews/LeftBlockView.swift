//
//  LeftBlockView.swift
//  CapSwift
//
//  Created by Caroline Ang on 08/09/26.
//

import SwiftUI

struct LeftBlockView: View {
    @Binding var tab: Int
    let level: LevelContent
    let question: BlockLevelContent
    @Bindable var viewModel: LevelViewModel
    
    @State var currentChevron = "chevron.down"
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 12){
            VStack (alignment: .leading) {
                Text(level.header)
                    .font(.title.bold())
                    .padding(.bottom, 5)
                Text(level.instruction)
                    .font(.title3)
                    .foregroundStyle(Color.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Divider()
            
            VStack (alignment: .leading) {
                Button(action: {
                    if currentChevron == "chevron.up" {
                        currentChevron = "chevron.down"
                    } else {
                        currentChevron = "chevron.up"
                    }
                }) {
                    HStack (alignment: .center) {
                        Text("Guide to Array Collection Type")
                            .font(.title2.bold())
                        
                        Image(systemName: currentChevron)
                            .opacity(question.showGuide ? 0 : 1)
                    }
                }
                .padding(.vertical, 8)
                .buttonStyle(.plain)
                .contentShape(RoundedRectangle(cornerRadius: 4))
                
                VStack(alignment: .leading) {
                    ForEach(viewModel.guide, id: \.id) { guide in
                        ShowGuideView(content: guide.content)
                    }
                }
                .opacity((question.showGuide || currentChevron == "chevron.up") ? 1 : 0)
            }
            Spacer()
        }
        .padding(16)
        .frame(width: 400, height: 800, alignment: .center)
        .background(.thinMaterial)
        .cornerRadius(20)
        
    }
}
