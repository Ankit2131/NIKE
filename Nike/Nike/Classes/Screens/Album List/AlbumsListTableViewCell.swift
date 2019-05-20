//
//  AlbumsListTableViewCell.swift
//  Nike
//
//  Created by Nanu on 5/19/19.
//  Copyright © 2019 Nanu. All rights reserved.
//

import UIKit

protocol AlbumCellDataSource {
    func fetchImage(forResult result: Result, completion: @escaping ImageDownloadCompletion)
}

class AlbumsListTableViewCell: UITableViewCell {

    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var albumLbl: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(withData data: Result, forDataSource dataSource: AlbumCellDataSource) {
        artistLbl.text = data.artistName
        albumLbl.text = data.collectionName
        loading.startAnimating()
        dataSource.fetchImage(forResult: data) { [weak self] image in
            self?.loading.stopAnimating()
            guard let image = UIImage(data: image) else{ return }
            self?.thumbnail.image = image
        }
    }
    
    func configureCellWithoutData() {
        artistLbl.text = "Data Not Available"
        albumLbl.text = "Data Not Available"
    }

}
