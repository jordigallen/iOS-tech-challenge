//
//  HomeViewModel.swift
//  RakutenTV
//
//  Created by JORDI GALLEN RENAU on 31/3/21.
//

import UIKit
import RxSwift

class HomeViewModel {
    private weak var view: HomeViewController?
    private var router: HomeRouter?
    private var repository = HomeRepository()

    func bind(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(sourceView: view)
    }

    func getListMoviesData() -> Observable<[MoviesModel.ListMovies]> {
        return repository.getList()
    }
}
