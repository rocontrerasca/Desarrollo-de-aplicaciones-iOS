//
//  SongCell.swift
//  iSongs
//
//  Created by Developer GaiaTelcom on 12/20/18.
//  Copyright © 2018 Developer GaiaTelcom. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
