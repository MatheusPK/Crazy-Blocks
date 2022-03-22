//
//  HomeViewController.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 14/03/22.
//

import UIKit
import GameKit

class HomeViewController: BaseViewController<HomeView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        GameCenterHelper.helper.delegate = self
        GameCenterHelper.helper.authenticatePlayer()
        mainView.playButton.isEnabled = GameCenterHelper.isAuthenticated
        
        mainView.playButton.addAction(UIAction { _ in
            GameCenterHelper.helper.createMatch()
        }, for: .touchUpInside)
    }
}

extension HomeViewController: GameCenterAuthDelegate {
    
    func presentMatchMaker(viewController: GKMatchmakerViewController) {
        viewController.matchmakerDelegate = self
        present(viewController, animated: true)
    }
    
    func didChangeAuthStatus(isAuthenticated: Bool) {
        mainView.playButton.isEnabled = isAuthenticated
    }
    
    func presentGameCenterAuth(viewController: UIViewController) {
        present(viewController, animated: true)
    }
    
}

extension HomeViewController: GKMatchmakerViewControllerDelegate {
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        
        viewController.dismiss(animated: true)
        
        let gameVC = GameViewController(mainView: GameView())
        gameVC.match = match
        
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true)
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    
}

