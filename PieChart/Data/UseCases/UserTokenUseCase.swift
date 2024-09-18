//
//  UserTokenUseCase.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 18/09/24.
//

import Foundation

protocol UserTokenUseCase {
    func getToken() -> String
    func setToken(token: String)
    func clearToken()
}

final class UserTokenUseCaseImpl: UserTokenUseCase {
    private let gateway: UserDefaultsGateway
    
    init(gateway: UserDefaultsGateway = UserDefaultsGatewayImpl()) {
        self.gateway = gateway
    }
    
    func getToken() -> String {
        return gateway.get(forKey: "token") ?? ""
    }
    
    func setToken(token: String) {
        gateway.set(value: token, forKey: "token")
    }
    
    func clearToken() {
        gateway.delete(forKey: "token")
    }
}
