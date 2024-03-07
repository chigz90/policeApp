//
//  ForceDetailsModel.swift
//  TestProject1
//
//  Created by Chirag Tailor on 09/02/2024.
//

import Foundation

// MARK: - ForceDetailsModel
struct ForceDetailsModel: Codable {
    let description: String?
    let url: String?
    let engagementMethods: [EngagementMethod]
    let telephone, id, name: String?

    enum CodingKeys: String, CodingKey {
        case description, url
        case engagementMethods = "engagement_methods"
        case telephone, id, name
    }
}

// MARK: - EngagementMethod
struct EngagementMethod: Codable {
    let url: String?
    let description, title: String?
}
