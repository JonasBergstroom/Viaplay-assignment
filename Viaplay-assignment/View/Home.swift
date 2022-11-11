//
//  Home.swift
//  Viaplay-assignment
//
//  Created by Jonas Bergström on 2022-11-11.
//

import SwiftUI

struct Home: View {
    @StateObject var jsonModel = JSONViewModel()
    var body: some View {
        VStack {
            if jsonModel.response._links.viaplaySections.isEmpty {
                ProgressView()
                    .onAppear(perform:  {
                        jsonModel.fetchData()
                    })
            }
            else {
                List(jsonModel.response._links.viaplaySections,id: \.self){section in
                    TitleView(title: section)
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .navigationTitle("Viaplay")
        .navigationBarTitleDisplayMode(.inline)
    }
}
