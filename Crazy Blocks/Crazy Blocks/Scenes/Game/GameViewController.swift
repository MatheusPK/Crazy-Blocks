//
//  GameViewController.swift
//  Crazy Blocks
//
//  Created by Matheus P.K on 22/03/22.
//

import Foundation
import UIKit
import GameKit

struct GameModel: Codable {
    var hitCount: Int = 0
}

extension GameModel {
    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    static func decode(data: Data) -> GameModel? {
        return try? JSONDecoder().decode(GameModel.self, from: data)
    }
}

class GameViewController: BaseViewController<GameView> {
    
    var match: GKMatch?
    
    private var gameModel = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        match?.delegate = self
    }
    
    private func sendData() {
        guard let match = match else { return }
        
        do {
            guard let data = gameModel.encode() else { return }
            try match.sendData(toAllPlayers: data, with: .reliable)
        } catch {
            print("Send data failed")
        }
    }
    
    private func updateUI() {
        
    }
    
}

extension GameViewController: GKMatchDelegate {
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        guard let model = GameModel.decode(data: data) else { return }
       
    }
}
