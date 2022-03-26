//
//  GameView.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 22/03/22.
//

import Foundation
import UIKit

class GameView: UIView {
    
    let joystickView = JoystickView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .black
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameView {
    private func setupConstraints() {
        setupJoystickView()
    }
    
    private func setupJoystickView() {
        joystickView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(joystickView)
        NSLayoutConstraint.activate([
            joystickView.bottomAnchor.constraint(equalTo: bottomAnchor),
            joystickView.leadingAnchor.constraint(equalTo: leadingAnchor),
            joystickView.trailingAnchor.constraint(equalTo: trailingAnchor),
            joystickView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.35)
        ])
    }
    

}
