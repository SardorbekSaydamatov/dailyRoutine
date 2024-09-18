//
//  LoginGateway.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 18/09/24.
//

import Foundation

protocol LoginGateway {
    func login(username: String, email: String, password: String) async throws -> LoginRes?
    
}

final class LoginGatewayImpl: LoginGateway {
    private let service: LoginService
    
    init(service: LoginService = LoginService()) {
        self.service = service
    }
    
    func login(username: String, email: String, password: String) async throws -> LoginRes? {
        return try await service.login(username: username, email: email, password: password)
    }
}
