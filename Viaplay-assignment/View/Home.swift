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
            if(UserDefaults.standard.get(forKey: "viaplay")?._links.viaplaySections ?? []).isEmpty{
                ProgressView()
                    .onAppear(perform:  {
                        jsonModel.fetchData()
                    })
            }
            else {
                List(UserDefaults.standard.get(forKey: "viaplay")?._links.viaplaySections ?? jsonModel.response._links.viaplaySections,id: \.self){section in
                    TitleView(title: section)
                }.environment(\.defaultMinListRowHeight, 150)
                .onAppear() {
                    UITableView.appearance().backgroundColor = UIColor.clear
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .navigationTitle("Viaplay")
        .navigationBarTitleDisplayMode(.inline)
    }
}
