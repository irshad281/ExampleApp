//
//  FakeModel.swift
//  Example
//
//  Created by Irshad Ahmad on 23/04/22.
//

import Foundation

struct FakeModel: Codable {
    var page, perPage, total, totalPages: Int?
    var data: [FakeData]?

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

extension FakeModel {
    struct FakeData: Codable {
        let id: Int
        let email, firstName, lastName: String
        let avatar: String

        enum CodingKeys: String, CodingKey {
            case id, email
            case firstName = "first_name"
            case lastName = "last_name"
            case avatar
        }
    }
}
