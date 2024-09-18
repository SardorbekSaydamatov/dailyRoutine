//
//  LoginService.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 13/09/24.
//

import Foundation


import Foundation

class LoginService {
    func login(username: String, email: String, password: String, completion: @escaping (LoginRes?) -> ()) {
        var req = Request(url: "http://213.230.120.137:2056/dj-rest-auth/login", method: .post)
        let body: LoginBody = LoginBody(username: username, email: email, password: password)
        req.set(body: body)
        
       // let request = AppRequest.login(username: username, password: password).request
        URLSession.shared.dataTask(with: req.request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let decodedResponse = try decoder.decode(LoginRes.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                    }
                } catch {
                    print("Error decoding: \(error)")
                    completion(nil)
                }
            } else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
            }
        }.resume()
    }
}

protocol NetworkServiceProtocol {
    var session: URLSession {get set}
}

struct NetworkService: NetworkServiceProtocol {
    var session: URLSession = .init(configuration: .default)
    
    func send(request: RequestFactory, completion: @escaping (Encodable?) -> ()) -> URLSessionDataTask {
        session.dataTask(with: request.request) { data, response, error in
            
        }
    }
}

struct LoginRes: Decodable {
    let key: String
}


enum HTTPMethod: String {
    case post
    case get
    
    var key: String {
        rawValue.uppercased()
    }
}

protocol RequestFactory {
    var request: URLRequest {get}

    init(url: String, method: HTTPMethod)

    mutating func set(body: Data?) -> Self
    mutating func set(body data: Encodable) -> Self
    mutating func addHeader(key: String, value: String) -> Self
}

struct Request: RequestFactory {
    var url: String
    var method: HTTPMethod
    var body: Data? = nil
    var headers: [String: String] = [
        "Content-Type": "application/json"
    ]
    
    init(url: String, method: HTTPMethod) {
        self.url = url
        self.method = method
    }
    
    @discardableResult
    mutating func set(body: Data?) -> Self {
        self.body = body
        return self
    }
    
    @discardableResult
    mutating func set(body data: Encodable) -> Self {
        return set(body: try? JSONEncoder().encode(data))
    }
    
    @discardableResult
    mutating func addHeader(key: String, value: String) -> Self {
        self.headers[key] = value
        return self
    }
    
    var request: URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method.key
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        return request
    }
}

//protocol Requestable {
//    var url: URL {get}
//    var body: Data {get}
//    var method: HTTPMethod {get}
//    var request: URLRequest {get}
//}
//
//enum AppRequest: Requestable {
//    case login(username: String, password: String)
//    
//    var url: URL {
//        switch self {
//        case .login:
//            return URL(string: "http://213.230.120.137:2056/dj-rest-auth/login")!
//        }
//    }
//    
//    var body: Data {
//        switch self {
//        case .login:
//            return Data()
//        }
//    }
//    
//    var method: HTTPMethod {
//        switch self {
//        case .login:
//            return .post
//        }
//    }
//    
//    var request: URLRequest {
//        var request = URLRequest(url: url)
//        request.httpMethod = method.key
//        request.httpBody = body
//        return request
//    }
//}

