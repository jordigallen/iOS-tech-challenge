//
//  CustomMovieCell.swift
//  RakutenTV
//
//  Created by JORDI GALLEN RENAU on 31/3/21.
//

import UIKit

class CustomMovieCell: UITableViewCell {
    @IBOutlet weak private var snapshot: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    public func configureTVShow(with movie: MoviesModel.ListMovies) {
        self.setupMovie(movie.images.snapshot)
    }
}

private extension CustomMovieCell {
    private func setupMovie(_ image: String?) {
        guard let imagePath = image else { return }
        snapshot.contentMode = .scaleAspectFit
        snapshot.image(from: imagePath, placeHolderImage: Asset.placeHolderMovie.image)
    }
}
