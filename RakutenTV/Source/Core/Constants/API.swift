//
//  Constamts.swift
//  RakutenTV
//
//  Created by JORDI GALLEN RENAU on 31/3/21.
//

import Foundation

struct API {
    struct Main {
        static let url = "https://gizmo.rakuten.tv"
    }

    struct Version {
        static let back = "/v3"
    }

    enum Endpoint {
        static let list = "/lists/{section}"
        static let detail = "/movies/{id}"
        static let trailer = "/streamings"
    }

    struct Mandatory {
        static let params = "?classification_id=6&device_identifier=ios&locale=es&market_code=es"
    }
}
