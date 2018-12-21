//
//  ViewController.swift
//  iSongs
//
//  Created by Developer GaiaTelcom on 12/20/18.
//  Copyright © 2018 Developer GaiaTelcom. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var currentIndex = -1
    
    @IBOutlet weak var tblViewSongs: UITableView!
    @IBOutlet weak var imgCoverSong: UIImageView!
    @IBOutlet weak var lblSongTitle: UILabel!
    
    @IBOutlet weak var volumeProgress: UIProgressView!
    var volume: Float = 1.0
    var songs : Array<Array<String>> = Array<Array<String>>()

    private var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        songs.append(["Al Filo de Tu Amor","Al-Filo-de-Tu-Amor","Al-Filo-de-Tu-Amor.jpg"])
        songs.append(["Clandestino","Clandestino", "Clandestino.jpg"])
        songs.append(["Deja vu","Deja-vu","Deja-vu.jpg"])
        songs.append(["Dulcito e Coco", "Dulcito-e-Coco","Dulcito-e-Coco.jpg"])
        songs.append(["El Ratico","El-Ratico","El-Ratico.jpg"])
        songs.append(["La Bicicleta","La-Bicicleta","La-Bicicleta.jpg"])
        songs.append(["Por Pura Curiosidad","Por-Pura-Curiosidad","Por-Pura-Curiosidad.jpg"])
        songs.append(["Robarte un Beso","Robarte-un-Beso","Robarte-un-Beso.jpg"])
        songs.append(["Te Sigo Esperando","Te-Sigo-Esperando","Te-Sigo-Esperando.jpg"])
        
        volumeProgress.setProgress(volume, animated: true)
    }

    @IBAction func shuffleSong(_ sender: UIButton) {
        
        let random: Int = Int(arc4random_uniform(UInt32(songs.count)))
        
        sender.tag = random
        
        playBtn(sender)
        
    }
    @IBAction func playBtn(_ sender: UIButton) {
        let index = sender.tag
        
        if currentIndex == index {
            player.play()
            return
        }
        
        if currentIndex != -1 && player.isPlaying {
            player.pause()
        }
       currentIndex = index
        self.tblViewSongs.selectRow(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .middle)
        
        let title = self.songs[index][0]
        let fileName = self.songs[index][1]
        let coverName = self.songs[index][2]
        
        let urlSong = Bundle.main.url(forResource: fileName , withExtension: ".mp3")
        
        do{
            try player = AVAudioPlayer(contentsOf: urlSong!)
            lblSongTitle.text = title
            imgCoverSong.image = UIImage(named: coverName)
            player.play()
            player.setVolume(volume, fadeDuration: 0)
        }
        catch{
            print("Error al cargar archivo \(title) en la posición \(index)")
        }
    }
    
    @IBAction func pause(_ sender: UIButton) {
        let index = sender.tag
        
        if index == currentIndex && player.isPlaying {
            player.pause()
        }
    }
    
    @IBAction func stop(_ sender: UIButton) {
        let index = sender.tag
        
        if index == currentIndex && player.isPlaying {
            player.stop()
            player.currentTime = 0.0
            currentIndex = -1
        }
    }
    
    @IBAction func lowVolume(_ sender: UIButton) {
        volume = volume - 0.1
        if volume < 0 {
            volume = 0.0
        }
        volumeProgress.setProgress(volume, animated: true)
        if currentIndex != -1 {
            player.setVolume(volume, fadeDuration: 0)            
        }
    }
    
    @IBAction func increaseVolume(_ sender: UIButton) {
        volume = volume + 0.1
        if volume > 1 {
            volume = 1.0
        }
        volumeProgress.setProgress(volume, animated: true)
        if currentIndex != -1 {
        player.setVolume(volume, fadeDuration: 0)        
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSong", for: indexPath) as! SongCell
        
        cell.lblTitle.text = self.songs[indexPath.row][0]
        cell.btnPlay.tag = indexPath.row
        cell.btnPause.tag = indexPath.row
        cell.btnStop.tag = indexPath.row        
        
        return cell
    }

}

