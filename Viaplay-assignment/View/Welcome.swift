//
//  Welcome.swift
//  Viaplay-assignment
//
//  Created by Jonas Bergström on 2022-11-11.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
            VStack {
                Image("viaplaylogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .background(Image("imagebg"))
                NavigationLink(destination: Home()){
                    Text("Börja titta")
                        .padding()
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(100)
            }
        }
    }
}


