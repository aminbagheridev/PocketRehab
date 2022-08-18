//
//  PlayerView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-28.
//

import Foundation
import UIKit
import AVKit
import SwiftUI

struct PlayerView: UIViewRepresentable {
    
    @State var player: AVPlayer
    
    func makeUIView(context: Context) -> PlayerUIView {
        return PlayerUIView(player: player)
    }
    
    func updateUIView(_ uiView: PlayerUIView, context: UIViewRepresentableContext<PlayerView>) {
        uiView.playerViewController.player = player
    }
}

class PlayerUIView: UIView {
    
    // MARK: Class Property
    
    let playerViewController = AVPlayerViewController()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(player: AVPlayer) {
        super.init(frame: .zero)
        self.playerSetup(player: player)
    }
    
    // MARK: Life-Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerViewController.view.frame = bounds
    }
    
    // MARK: Class Methods
    
    private func playerSetup(player: AVPlayer) {
        playerViewController.player = player
        playerViewController.view.backgroundColor = .clear
        self.addSubview(playerViewController.view)
    }
}
