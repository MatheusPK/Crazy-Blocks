//
//  HomeButton.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 22/03/22.
//

import Foundation
import UIKit

class HomeButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        configuration = UIButton.Configuration.filled()
        configuration?.title = title
        configuration?.baseForegroundColor = .white
        configuration?.baseBackgroundColor = .darkGray
        configuration?.background.strokeColor = .white
        configuration?.background.strokeWidth = 2
        configuration?.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        configuration?.buttonSize = .large
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
