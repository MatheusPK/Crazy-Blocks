//
//  JoystickView.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 23/03/22.
//

import Foundation
import UIKit

class JoystickView: UIView {
    let leftButton = BaseButton(title: "⬅️")
    let rightButton = BaseButton(title: "➡️")
    let upButton = BaseButton(title: "⬆️")
    let downButton = BaseButton(title: "⬇️")
    
    init() {
        super.init(frame: .zero)
        setupConstraints()
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension JoystickView {
    private func setupConstraints() {
        setupJoystick()
    }
    
    private func setupJoystick() {
        
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftButton)
        NSLayoutConstraint.activate([
            leftButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80),
            leftButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightButton)
        NSLayoutConstraint.activate([
            rightButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 80),
            rightButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        upButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(upButton)
        NSLayoutConstraint.activate([
            upButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            upButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80)
        ])
        
        downButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(downButton)
        NSLayoutConstraint.activate([
            downButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            downButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 80)
        ])
        
    }
}
