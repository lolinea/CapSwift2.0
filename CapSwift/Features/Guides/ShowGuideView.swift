//
//  ShowGuideView.swift
//  CapSwift
//
//  Created by Caroline Ang on 05/09/26.
//

import SwiftUI

struct ShowGuideView: View {
    let content: GuideContent
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(content.mods)
                    .font(.title3.bold())
                    .padding(6)
                    .background(Color.blue.opacity(0.25))
                    .cornerRadius(8)
                
                Text(content.desc)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.title3)
            }
            
            Text(content.ex)
                .fixedSize(horizontal: false, vertical: true)
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .padding(.bottom, 12)
    }
}
