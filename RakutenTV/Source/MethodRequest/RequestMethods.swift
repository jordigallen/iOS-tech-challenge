//
//  RequestMethos.swift
//  RakutenTV
//
//  Created by JORDI GALLEN RENAU on 31/3/21.
//

import Foundation

public enum ParameterRequest: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum RequestAdd: String {
    case value = "application/json"
    case headerField = "Content-Type"
}
