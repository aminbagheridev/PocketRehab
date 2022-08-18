//
//  LoopingPlayer.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-08-12.
//

import SwiftUI
import AVFoundation

struct LoopingPlayer: UIViewRepresentable {
    
    //passing in a url (this wil need to be set as its not being set = to anuthing,
    let videoUrl: URL
    
    func makeUIView(context: Context) -> some UIView {
        return UIPlayerView(url: videoUrl)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //Do Nothing
    }
}

//this view 'goes into' the looping player UIViewRepresentable. This allows us to use uikit stuff in swiftui
class UIPlayerView: UIView {
    
    // this is a "view"", the player will go over it
    private var playerLayer = AVPlayerLayer()
    
    //make sure that url is required to be put in
    required init(url: URL) {
        
        // we do this manually,
        super.init(frame: CGRect.zero)
        // Can't call super.init() here because it's a convenience initializer not a desginated initializer
        
        // load video
        let fileUrl = url
        let playerItem = AVPlayerItem(url: fileUrl) // the video
        
        //setup player
        let player = AVPlayer(playerItem: playerItem) //this is the interface, and we are passing in a video item
        playerLayer.player = player
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        layer.addSublayer(playerLayer)
        
        //Loop
        player.actionAtItemEnd = .none //this says the play3er should do nothing when it end, just be a good boy 
        ///listening for a specific notification
        NotificationCenter.default.addObserver(self, selector: #selector(rewindVideo(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem) //listening for the player. when it [lays till the end, it will run the rewind video code which just sets the video play time to 0. it basically never stops running
        
        //Play
        player.play()
        
    }
    
    // every time we get a notification, run the objc method
    @objc func rewindVideo(notification: Notification) {
        playerLayer.player?.seek(to: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
