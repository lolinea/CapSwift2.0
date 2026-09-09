//
//  DataTypes.swift
//  CapSwift
//
//  Created by Caroline Ang on 08/09/26.
//

struct BlockLevelContentSolutionPossibilities: Decodable {
    let image: String
    let respond: String
}

struct BlockLevelContentSolutionCorrect: Decodable {
    let answer: String
    let words: String
    let image: String
    let imageWrong: String
}

struct BlockLevelContentSolution: Decodable {
    let count: Int
    let initImage: String
    let correct: BlockLevelContentSolutionCorrect
    let possibilities: [String: BlockLevelContentSolutionPossibilities]
}

struct BlockLevelContent: Decodable {
    let codePrefix: String
    let answerPossibilities: [String]
    let showGuide: Bool
    let quest: String
    let solution: BlockLevelContentSolution
}

struct BlockLevelData: Decodable {
    let id: Int
    let content: BlockLevelContent
    
}

struct FillLevelContent: Decodable {
    let codes: CodeData
    let answers: answerData
    
    struct CodeData: Decodable {
        let codePrefix: String
        let codeSuffix: String
        let codeTeaser: String
    }
    
    struct answerData: Decodable {
        let removePrefix: [String]
        let solution: [String]
        let result: [String: String]
    }
}

struct FillLevelData: Decodable {
    let id: Int
    let content: FillLevelContent
}

enum QuestionContent {
    case block(BlockLevelContent)
    case fill(FillLevelContent)
}

enum QuestionType: String, Decodable {
    case block
    case fill
}

struct GuideContent: Decodable {
    let mods: String
    let desc: String
    let ex: String
}

struct GuideData: Decodable {
    let id: Int
    let content: GuideContent
}

struct LevelContent: Decodable {
    let header: String
    let instruction: String
    let type: QuestionType
}

struct LevelData: Decodable {
    let id: Int
    let content: LevelContent
}
