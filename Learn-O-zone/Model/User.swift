//
//  User.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 16/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import Foundation

class User: NSObject {
    public var username: String
    public var avatar: String
    public var score: Int
    public var bestScore: Int
    
    init(username: String, avatar: String, score: Int, bestScore: Int) {
        self.username = username
        self.avatar = avatar
        self.score = score
        self.bestScore = bestScore
    }
    
    func setScore(currentScore: Int) {
        score = currentScore
    }
    
    func setBestScore(currentBestScore: Int) {
        bestScore = currentBestScore
    }
}
