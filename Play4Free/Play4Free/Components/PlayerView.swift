//
//  VideoBackgroundView.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 30.01.24.
//

import SwiftUI
import AVKit
import AVFoundation

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}


class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        let fileUrl = Bundle.main.url(forResource: "vbg", withExtension: "mov")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resize
        layer.addSublayer(playerLayer)
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        player.play()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
