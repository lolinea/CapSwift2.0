//
//  LevelView.swift
//  CapSwift
//
//  Created by Caroline Ang on 04/09/26.
//

import SwiftUI

struct LevelView: View {
    @State private var selectedTab: Int = 0
    @State private var viewModel = LevelViewModel()
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            TabView(selection: $selectedTab) {
                ForEach(viewModel.levels, id: \.id) {level in
                    Tab("Level \(level.id + 1)", systemImage: "checkmark", value: level.id){
                        EachLevelView(tab: $selectedTab, viewModel: viewModel)
                    }
                }
            }
            .tabViewStyle(.sidebarAdaptable)
            .onChange(of: selectedTab) {
                viewModel.userInput = ""
                viewModel.resultStatus = ""
                viewModel.resultBool = false
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
