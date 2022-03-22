//
//  HomeViewController.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 14/03/22.
//

import UIKit

class HomeViewController: BaseViewController<HomeView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        GameCenterHelper.helper.delegate = self
        GameCenterHelper.helper.authenticatePlayer()
        mainView.playButton.isEnabled = GameCenterHelper.isAuthenticated
        
        mainView.playButton.addAction(UIAction { _ in
            
        }, for: .touchUpInside)
    }
}

extension HomeViewController: GameCenterAuthDelegate {
    
    func didChangeAuthStatus(isAuthenticated: Bool) {
        mainView.playButton.isEnabled = isAuthenticated
    }
    
    func presentGameCenterAuth(viewController: UIViewController) {
        present(viewController, animated: true)
    }
    
}

