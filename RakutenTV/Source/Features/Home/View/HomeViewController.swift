//
//  HomeView.swift
//  RakutenTV
//
//  Created by JORDI GALLEN RENAU on 31/3/21.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activity: UIActivityIndicatorView!
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var movies = [MoviesModel.ListMovies]()
    private var disposebag = DisposeBag()
    static let cellTableId = "CustomMovieCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        prepareTableView()
        getData()
    }
}

extension HomeViewController: UITableViewDelegate {

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: HomeViewController.cellTableId, for: indexPath) as? CustomMovieCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configureTVShow(with: movies[indexPath.row])
        return cell
    }
}

private extension HomeViewController {
    func getData() {
        return viewModel.getListMoviesData()
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe { movies in
                self.movies = movies
                self.reloadTableView()
            } onError: { error in
                print("Error: \(error.localizedDescription)")
            } onCompleted: {
            }.disposed(by: disposebag)
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.tableView.reloadData()
        }
    }

    func prepareTableView() {
        tableView.register(UINib.init(nibName: HomeViewController.cellTableId, bundle: nil), forCellReuseIdentifier: HomeViewController.cellTableId)
    }
}
