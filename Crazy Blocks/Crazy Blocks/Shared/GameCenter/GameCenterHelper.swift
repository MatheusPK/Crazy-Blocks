//
//  GameCenterAuthHelper.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 14/03/22.
//

protocol GameCenterAuthDelegate {
    func presentGameCenterAuth(viewController: UIViewController)
    func didChangeAuthStatus(isAuthenticated: Bool)
    func presentMatchMaker(viewController: GKMatchmakerViewController)
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
    
    func createMatch() {
        guard GKLocalPlayer.local.isAuthenticated else { return }
        guard let delegate = delegate else { return }
        
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 4
        
        guard let vc = GKMatchmakerViewController(matchRequest: request) else { return }
        vc.matchmakingMode = .default

        delegate.presentMatchMaker(viewController: vc)
        
    }
    
    
    
}
