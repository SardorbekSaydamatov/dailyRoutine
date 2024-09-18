//
//  GetTokenUseCase.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 18/09/24.
//

import Foundation

protocol GetTokenUseCase {
    @discardableResult
    func getToken(username: String, email: String, password: String) async throws -> String
}

final class GetTokenUseCaseImpl: GetTokenUseCase {
    private let gateway: LoginGateway
    
    init(gateway: LoginGateway = LoginGatewayImpl()) {
        self.gateway = gateway
    }
    
    @discardableResult
    func getToken(username: String, email: String, password: String) async throws -> String {
        guard let token = try await gateway.login(username: username, email: email, password: password)?.key else {
            return ""
        }
        UserTokenUseCaseImpl().setToken(token: token)
        return token
    }
}
