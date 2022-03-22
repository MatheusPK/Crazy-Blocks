//
//  HomeView.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 14/03/22.
//

import Foundation
import UIKit

final class HomeView: UIView {
    
    let playButton = HomeButton(title: "JOGAR")
    
    let leaderboardButton = HomeButton(title: "PLACAR DE JOGADORES")
    
    init() {
        super.init(frame: .zero)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeView {
    
    private func setupConstraints() {
        setupPlayButton()
        setupLeaderboardButton()
    }
    
    fileprivate func setupPlayButton() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(playButton)
        NSLayoutConstraint.activate([
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7)
        ])
    }
    
    fileprivate func setupLeaderboardButton() {
        leaderboardButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leaderboardButton)
        NSLayoutConstraint.activate([
            leaderboardButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 20),
            leaderboardButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            leaderboardButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7)
        ])
    }
    
}
    
