//
//  ForceDetailsViewModel.swift
//  TestProject1
//
//  Created by Chirag Tailor on 09/02/2024.
//

import Foundation

class ForceDetailsViewModel: ObservableObject {
    
    @Published var forceDetails = ForceDetailsModel(description: "", url: "", engagementMethods: [], telephone: "", id: "", name: "")
    
    
    init(forceName: String, forceID: String) {
        Task {
            await getForceDetail(forceName: forceName, forceID: forceID)
        }
    }
    
    @MainActor
    func getForceDetail(forceName: String, forceID: String) async {
        guard let url = URL(string: Endpoints.shared.forcesURL+"/"+forceID) else {
            print("Invalid URL")
            return
        }
        print(url)
        let decoder = JSONDecoder()
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let forceDetails = try decoder.decode(ForceDetailsModel.self, from: data)
            self.forceDetails = forceDetails
            print(self.forceDetails)
        } catch {
            print("Invalid Data for \(forceName) --- \(error.localizedDescription)")
        }
    }
    
}
