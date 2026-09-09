//
//  RightBlockView.swift
//  CapSwift
//
//  Created by Caroline Ang on 08/09/26.
//

import SwiftUI

struct RightBlockView: View {
    @Binding var tab: Int
    let level: LevelContent
    let question: BlockLevelContent
    @Bindable var viewModel: LevelViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            
            VStack (alignment: .leading){
                
                Text("**Quest**: \(question.quest)")
                    .font(.title2)
                
                Divider()
                    .padding(.vertical, 8)
            }
            
            InnerCodeBlockView(tab: $tab, viewModel: viewModel, content: question)
            
            VStack (alignment: .leading){
                Divider()
                    .padding(.vertical, 8)
                
                Text("Answer")
                    .font(.title2.bold())
            }
            
            BlocksView(viewModel: viewModel)
            
            HStack (alignment: .center) {
                Text(viewModel.resultStatus)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(viewModel.resultBool ? Color.green.opacity(0.4) : Color.red.opacity(0.4))
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                    )
                    .opacity(viewModel.resultStatus != "" ? 1 : 0)
                
                Spacer()
                
                Button(action: {viewModel.checkBlockLevel(question)}) {
                    Text("Check Answer")
                        .foregroundStyle(Color(.labelColor))
                }
                .buttonStyle(.glassProminent)
            }
            
            HStack {
                Spacer()
                Image(viewModel.resultImage)
//                    .resizable()
    //                .frame(width: 200, height: 200)
    //                .opacity(viewModel.resultBool ? 1 : 0)
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button(action: {
                    tab += 1
                }) {
                    Text("Next Level")
                        .foregroundStyle(Color(.labelColor))
                }
                .buttonStyle(.glassProminent)
            }
            .disabled(!viewModel.resultBool)
        }
        .padding(16)
        .frame(width: 900, height: 800, alignment: .center)
        .background(.thinMaterial)
        .cornerRadius(20)
    }
    
}
