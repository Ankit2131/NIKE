//
//  AlbumDetailsViewController.swift
//  Nike
//
//  Created by Nanu on 5/19/19.
//  Copyright © 2019 Nanu. All rights reserved.
//

import UIKit

class AlbumDetailsViewController: UIViewController {

    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var albumLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var releaseInfoLbl: UILabel!
    @IBOutlet weak var copyrightLbl: UILabel!
    
    var albumData: Result!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumLbl.text = albumData.collectionName
        artistLbl.text = albumData.artistName

        if let genres = albumData.genres?.map({ (gener) -> String in
            guard let name = gener.name else { return "" }
            return name
        }){
            genreLbl.text = genres.joined(separator: " ")
        }
        releaseInfoLbl.text = albumData.releaseDate
        copyrightLbl.text = albumData.copyright
        
        guard let image = UIImage(data: albumData.image ?? Data()) else{ return }
        albumArt.image = image
        
    }
    
    @IBAction func goToITunesPage(_ sender: Any) {
        if let url = URL(string: albumData.url ?? "") {
            UIApplication.shared.open(url)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
