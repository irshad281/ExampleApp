//
//  NetworkViewModel.swift
//  Example
//
//  Created by Irshad Ahmad on 23/04/22.
//

import Foundation
import Combine
import NetworkInterface

class NetworkViewModel {
    var model = CurrentValueSubject<[FakeModel.FakeData], Never>([])
    
    init() {
        getData()
    }
    
    func getData() {
        FakeSrvice.getUserList().sink { status in
            switch status {
            case .finished:
                break
            case .failure(let error):
                print(error)
            }
        } receiveValue: { model in
            self.model.send(model.data ?? [])
        }.store(in: &cancellables)
    }
    
    func uploadImage(_ image: Any) {
        
    }
}
