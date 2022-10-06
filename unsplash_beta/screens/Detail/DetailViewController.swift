//
//  DetailViewController.swift
//  unsplash_beta
//
//  Created by Jordy De Jonghe on 05/10/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var CircularProgressContainer: CircularProgressView! {
        didSet{
            CircularProgressContainer.radius = 30
            CircularProgressContainer.lineWidth = 10
            CircularProgressContainer.progressForegroundColor = getRatingColor(rating: detailViewModel.movie?.rating ?? 0)
            CircularProgressContainer.createCircularPath()
        }
    }
    
    var detailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        guard let movie = detailViewModel.movie else { return }
        self.title = movie.title
        self.descriptionLabel.text = movie.summary
        self.image.sd_setImage(with: URL(string: movie.largeCoverimage))
        self.releaseYearLabel.text = String(movie.year)
        self.durationLabel.text = String(movie.runtime)
        self.ratingLabel.text = String(movie.rating)
        CircularProgressContainer.progressAnimation(duration: 0.5, value: movie.rating)
    }
    
    private func getRatingColor(rating: Double) -> UIColor{
        if(rating > 7) { return UIColor.green }
        if(rating > 4) { return UIColor.orange }
        if(rating < 4) { return UIColor.red }
        return UIColor.gray
    }
}
