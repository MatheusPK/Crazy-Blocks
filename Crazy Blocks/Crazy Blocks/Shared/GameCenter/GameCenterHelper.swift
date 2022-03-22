//
//  GameCenterAuthHelper.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 14/03/22.
//

protocol GameCenterAuthDelegate {
    func presentGameCenterAuth(viewController: UIViewController)
    func didChangeAuthStatus(isAuthenticated: Bool)
}

import GameKit

final class GameCenterHelper: NSObject, GKLocalPlayerListener {
    
    static let helper = GameCenterHelper()
    
    var delegate: GameCenterAuthDelegate?
    
    private override init() {
        super.init()
    }
    
    static var isAuthenticated: Bool {
        return GKLocalPlayer.local.isAuthenticated
    }
    
    func authenticatePlayer() {
        
        guard let delegate = self.delegate else { return }

        GKLocalPlayer.local.authenticateHandler = { gcAuthVC, error in
            
           delegate.didChangeAuthStatus(isAuthenticated: GKLocalPlayer.local.isAuthenticated)
            
            if GKLocalPlayer.local.isAuthenticated {
                GKLocalPlayer.local.register(self)
            } else if let vc = gcAuthVC {
                delegate.presentGameCenterAuth(viewController: vc)
            }
            else {
                print("Error authentication to GameCenter: \(error?.localizedDescription ?? "none")")
            }
        }
        
    }
    
    
    
}
