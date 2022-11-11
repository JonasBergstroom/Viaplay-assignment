//
//  TitleView.swift
//  Viaplay-assignment
//
//  Created by Jonas Bergström on 2022-11-11.
//

import SwiftUI

struct TitleView: View {
    var title: Section
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text(title.title)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.black)
        })
    }
}
