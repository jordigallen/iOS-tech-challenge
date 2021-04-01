//
//  HomeRepository.swift
//  RakutenTV
//
//  Created by JORDI GALLEN RENAU on 31/3/21.
//

import Foundation
import RxSwift

class HomeRepository {
    //    free-la-mejor-seleccion-de-peliculas
    //    cinema-ultimos-estrenos
    //    free-rakuten-stories
    //    free-peliculas-de-accion
    //    cinema-2010-2020-una-decada-de-cine-compra-desde-3-99
    //    free-peliculas-de-comedia
    func getList() -> Observable<[MoviesModel.ListMovies]> {
        return Observable.create { obeserver in
            let session = URLSession.shared
            let urlCompossed = API.Main.url +
                API.Version.back +
                API.Endpoint.list +
                API.Mandatory.params

            let completeUrl = urlCompossed.replacingOccurrences(of: "{section}", with: "cinema-ultimos-estrenos")
            guard let url = URL(string: completeUrl) else {
                print("Error to create URL GetList")
                return () as! Disposable
            }
            var request = URLRequest(url: url)
            request.httpMethod = ParameterRequest.get.rawValue
            request.addValue(RequestAdd.value.rawValue, forHTTPHeaderField: RequestAdd.headerField.rawValue)
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil,
                      let response = response as? HTTPURLResponse  else {
                    return
                }
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(MoviesModel.self, from: data)
                        obeserver.onNext(movies.data.contents.data)
                    } catch let parseError {
                        obeserver.onError(parseError)
                        print("JSON Error \(parseError.localizedDescription)")
                    }

                } else if response.statusCode == 401 {
                    print("Error 401")
                }
                obeserver.onCompleted()
            }.resume()
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
}


