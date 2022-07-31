//
//  FakeRequest.swift
//  Example
//
//  Created by Irshad Ahmad on 23/04/22.
//

import Foundation
import NetworkInterface

var fakeBaseUrl = "https://reqres.in/api/"

enum FakeRequest: Request {
    case userList(page: Int)
    
    var method: HTTPMethod {.get }
    
    var baseURLString: String { fakeBaseUrl }
    
    var endPoint: String {
        switch self {
        case .userList(let page):
            return "users?page=\(page)"
        }
    }
    
    func body() throws -> Data? { nil }
    
    func headers() -> [String : String] { [:] }
}
