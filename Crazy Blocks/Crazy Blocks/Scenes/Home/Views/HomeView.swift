//
//  HomeView.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 14/03/22.
//

import Foundation
import UIKit

final class HomeView: UIView {
    
    let playButton: UIButton = {
        let button = UIButton()

        button.setTitle("Jogar", for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return button
    }()
    
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
        playButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(playButton)
        NSLayoutConstraint.activate([
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
