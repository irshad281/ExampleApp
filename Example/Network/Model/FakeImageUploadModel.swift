//
//  FakeImageUploadModel.swift
//  Example
//
//  Created by Irshad Ahmad on 07/07/22.
//

import Foundation

// MARK: - Welcome
struct FakeImageUploadModel: Codable {
    var data: FakeImageUploadData
    var success: Bool
    var status: Int
}

// MARK: - DataClass
struct FakeImageUploadData: Codable {
    var id: String
    var title, dataDescription: String?
    var datetime: Int
    var type: String
    var animated: Bool
    var width, height, size, views: Int
    var bandwidth: Int
    var vote: String?
    var favorite: Bool
    var nsfw, section, accountURL: String?
    var accountID: Int
    var isAd, inMostViral, hasSound: Bool
    var tags: [String]?
    var adType: Int
    var adURL, edited: String
    var inGallery: Bool
    var deletehash, name: String
    var link: String
    let error: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case dataDescription = "description"
        case datetime, type, animated, width, height, size, views, bandwidth, vote, favorite, nsfw, section
        case accountURL = "account_url"
        case accountID = "account_id"
        case isAd = "is_ad"
        case inMostViral = "in_most_viral"
        case hasSound = "has_sound"
        case tags
        case adType = "ad_type"
        case adURL = "ad_url"
        case edited
        case inGallery = "in_gallery"
        case deletehash, name, link, error
    }
}
