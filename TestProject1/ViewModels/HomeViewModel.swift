//
//  HomeViewModel.swift
//  TestProject1
//
//  Created by Chirag Tailor on 08/02/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var forces = [PoliceForces]()
    
    init() {
        Task {
            await getPoliceForce()
        }
    }
    
    @MainActor
    func getPoliceForce() async {
        guard let url = URL(string: Endpoints.shared.forcesURL) else {
            print("Invalid URL")
            return
        }
        let decoder = JSONDecoder()
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let forces = try decoder.decode([PoliceForces].self, from: data)
            self.forces = forces
            //print(self.forces)
        } catch {
            print("Invalid Data \(error.localizedDescription)")
        }
    }
}
