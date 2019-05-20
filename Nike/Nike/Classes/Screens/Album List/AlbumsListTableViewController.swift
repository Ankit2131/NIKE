//
//  AlbumsListTableViewController.swift
//  Nike
//
//  Created by Nanu on 5/19/19.
//  Copyright © 2019 Nanu. All rights reserved.
//

import UIKit

class AlbumsListTableViewController: UITableViewController {
    
    fileprivate var results: [Result]?
    fileprivate var viewModel: AlbumsListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = AlbumsListViewModel(withDelegate: self)
        self.viewModel.fetchData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumsCell", for: indexPath) as! AlbumsListTableViewCell
        if let result = self.results?[indexPath.row] {
            cell.configureCell(withData: result, forDataSource: self)
        } else {
            cell.configureCellWithoutData()
        }
        
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = self.results?[indexPath.row]
        self.performSegue(withIdentifier: "albumDetails", sender: result)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "albumDetails" {
            let viewController = segue.destination as! AlbumDetailsViewController
            if let data = sender as? Result {
                viewController.albumData = data
            }
        }
    }

}

extension AlbumsListTableViewController: ViewModelDelegate {
    
    func didFetchData(withResults result: [Result]) {
        self.results = result
        tableView.reloadData()
    }
    
    func didFailDataFetch() {
        // show error
    }
}

extension AlbumsListTableViewController: AlbumCellDataSource {
    func fetchImage(forResult result: Result, completion: @escaping ImageDownloadCompletion) {
        self.viewModel.fetchAlbumImage(withURL: result.artworkUrl100 ?? "") { imageData in
            result.image = imageData
            completion(imageData)
        }
    }
}
