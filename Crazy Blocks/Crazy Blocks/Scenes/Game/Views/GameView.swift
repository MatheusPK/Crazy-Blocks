//
//  GameView.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 22/03/22.
//

import Foundation
import UIKit

class GameView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
