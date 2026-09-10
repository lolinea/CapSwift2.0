//
//  LevelViewModel.swift
//  CapSwift
//
//  Created by Caroline Ang on 04/09/26.
//

import Foundation
import Observation

@Observable
class LevelViewModel {
    var userInput: String = ""
    var resultStatus: String = ""
    var resultBool: Bool = false
    var resultImage: String = "Level1"
    
    var levels: [LevelData] = []
    var guide: [GuideData] = []
    var answersFill: [FillLevelData] = []
    var answersBlock: [BlockLevelData] = []
    
    var placedBlockAnswers: [String?] = []
    var availableAnswers: [String] = []
    
    init() {
        loadLevels()
        loadGuide()
        loadAnswersForFill()
        loadAnswersForBlock()
    }
    
    func getQuestionContent(id: Int) -> QuestionContent? {
        guard let level = getLevelData(id: id) else {
            return nil
        }
        
        switch level.content.type {
        case .block:
            guard let block = answersBlock.first(where: { $0.id == id }) else {
                return nil
            }
            return .block(block.content)
            
        case .fill:
            guard let fill = answersFill.first(where: { $0.id == id }) else {
                return nil
            }
            return .fill(fill.content)
        }
    }
    
    func getLevelData(id: Int) -> LevelData? {
        guard levels.indices.contains(id) else { return nil }
        return levels[id]
    }
    
    func setupBlockLevel(id: Int) {
        guard let block = answersBlock.first(where: {$0.id == id}) else { return }
        
        placedBlockAnswers = Array(repeating: nil, count: block.content.solution.count)
        availableAnswers = block.content.answerPossibilities
        
        userInput = ""
        resultBool = false
        resultStatus = ""
    }
    
    func placeAnswer(answer: String, at index: Int) {
        guard placedBlockAnswers.indices.contains(index) else { return }
        
        if let existing = placedBlockAnswers[index] {
            availableAnswers.append(existing)
        }
        
        if let sourceIndex = availableAnswers.firstIndex(of: answer) {
            availableAnswers.remove(at: sourceIndex)
        }
        
        placedBlockAnswers[index] = answer
        updateUserInputFromBlocks()
    }
    
    func removeAnswer(at index: Int) {
        guard placedBlockAnswers.indices.contains(index), let answer = placedBlockAnswers[index] else { return }
        
        availableAnswers.append(answer)
        placedBlockAnswers[index] = nil
        updateUserInputFromBlocks()
    }
    
    func checkBlockLevel(_ question: BlockLevelContent) {
        if question.solution.correct.answer == userInput {
            resultStatus = question.solution.correct.words
            resultImage = question.solution.correct.image
            resultBool = true
            return
        }
        
        for (solution, result) in question.solution.possibilities {
            if solution == userInput {
                resultStatus = result.respond
                resultImage = result.image
                resultBool = false
                return
            }
        }
        
        resultStatus = "I can't compile your answer. Try again!"
        resultImage = question.solution.correct.imageWrong
        resultBool = false
    }
}

private extension LevelViewModel {
    func loadLevels() {
        guard let url = Bundle.main.url(forResource: "levels", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Int : LevelContent].self, from: data)
            let unsorted = decoded.map { key, value in LevelData(id: key, content: value)}
            levels = unsorted.sorted(by: {$0.id < $1.id})
        } catch { }
    }
    
    func loadGuide() {
        guard let url = Bundle.main.url(forResource: "guide", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Int : GuideContent].self, from: data)
            
            guide = decoded.map { key, value in GuideData(id: key, content: value)}
        } catch { return  }
    }
    
    func loadAnswersForFill() {
        guard let url = Bundle.main.url(forResource: "answersFill", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Int : FillLevelContent].self, from: data)
            
            answersFill = decoded.map { key, value in FillLevelData(id: key, content: value)}
        } catch { return }
    }
    
    func loadAnswersForBlock() {
        guard let url = Bundle.main.url(forResource: "answersBlock", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Int : BlockLevelContent].self, from: data)
            
            answersBlock = decoded
                .map { key, value in BlockLevelData(id: key, content: value)}
        } catch { return  }
    }
    
    func updateUserInputFromBlocks() {
        userInput = placedBlockAnswers.compactMap {$0 }.joined(separator: "")
    }
}
