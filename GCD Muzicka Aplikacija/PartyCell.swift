//
//  PartyCell.swift
//  GCD Muzicka Aplikacija
//
//  Created by Vuk on 3/19/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {


    @IBOutlet weak var videoPriveiwImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async { //odneo ga sa main thread-a
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync { //vraca ga na main thread
                    self.videoPriveiwImage.image = UIImage(data: data)
                }
            } catch {}
        }
    }
    
    // OVO NIJE VAZNO STO JE DEFAULT DAO
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
