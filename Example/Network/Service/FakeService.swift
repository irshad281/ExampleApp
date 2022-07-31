//
//  FakeSrvice.swift
//  Example
//
//  Created by Irshad Ahmad on 23/04/22.
//

import Combine
import Foundation
import NetworkInterface

struct FakeSrvice {
    static func getUserList(page: Int = 1) -> Future<FakeModel, RequestError> {
        NetworkInterface.performRequest(FakeRequest.userList(page: page))
    }
}
