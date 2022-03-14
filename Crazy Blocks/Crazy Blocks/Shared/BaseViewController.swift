//
//  BaseViewController.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 14/03/22.
//

import Foundation
import UIKit

class BaseViewController<V: UIView>: UIViewController {
    
    var mainView: V
    
    init(mainView: V) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
}
