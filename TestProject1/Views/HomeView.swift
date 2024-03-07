//
//  ContentView.swift
//  TestProject1
//
//  Created by Chirag Tailor on 08/02/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.forces, id: \.id) { forces in
                NavigationLink {
                    ForcesDetailsView(title: forces.name, id: forces.id)
                        .padding()
                } label: {
                    Text(forces.name)
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
