//
//  ForcesDetailsView.swift
//  TestProject1
//
//  Created by Chirag Tailor on 09/02/2024.
//

import SwiftUI

struct ForcesDetailsView: View {
    
    @State var title: String = ""
    @State var id: String = ""
    @StateObject var forceDetailsViewModel = ForceDetailsViewModel(forceName: "Leicestershire", forceID: "leicestershire")
    
    
    
    var body: some View {
        Text(forceDetailsViewModel.forceDetails.description?.htmlConvertedString ?? "")
            .navigationTitle(title)
        
            .onAppear {
                Task {
                    await forceDetailsViewModel.getForceDetail(forceName: title, forceID: id)
                    print(forceDetailsViewModel.forceDetails)
                }
            }
        
        Divider()
        
        
    }
}

#Preview {
    ForcesDetailsView()
}

extension String {
    var htmlConvertedString : String {
        let string = self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        return string
    }
}
