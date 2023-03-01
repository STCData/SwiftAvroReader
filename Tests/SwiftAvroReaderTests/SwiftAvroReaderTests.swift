import XCTest
import SwiftAvroCore

@testable import SwiftAvroReader

extension Data {
    static func random(length: Int) throws -> Data {
        return Data((0 ..< length).map { _ in UInt8.random(in: UInt8.min ... UInt8.max) })
    }
}

struct Kitty: Codable {
    enum KittyColor: Codable, CaseIterable {
        case Brown
        case White
        case Black
    }
    let name: String
    let color: KittyColor
    
    static func random() -> Self {
        Self(name:[
            "Whiskers",
            "Felix",
            "Oscar",
            "Smudge",
            "Fluffy",
            "Angel",
            "Lady",
            "Lucky"
        ].randomElement()!, color:KittyColor.allCases.randomElement()!)
    }
}


struct KittyAction: Codable {
    enum KittyActionType: Codable, CaseIterable {
        case meow
        case jump
        case bite
    }
    let label: String
    let type: KittyActionType
    let timestamp: Date
    let dataValue: Data
    let intValue: Int
    let floatValue: Float
    let doubleValue: Double
    let kitty: Kitty
    
    static func random() -> Self {
        Self(label: [
            "yah just kidding",
            "random text",
            "very very very very very very long label",
            "hahahhhahah"
        ].randomElement()!, type: KittyActionType.allCases.randomElement()!, timestamp: Date(), dataValue: try! Data.random(length: Int.random(in: 1...40)), intValue: Int.random(in: -100...4990), floatValue: Float.random(in: -1000...40), doubleValue: Double.random(in: -100...40), kitty: Kitty.random())
    }
}

fileprivate let packageRootPath = URL(fileURLWithPath: #file).pathComponents
    .prefix(while: { $0 != "Tests" }).joined(separator: "/").dropFirst()

fileprivate let testDataPath = packageRootPath + "/TestData"


final class SwiftAvroReaderTests: XCTestCase {
    
    func testFixturesCreation() throws {
        
        let avroActions = Avro()
        let _ = avroActions.decodeSchema(schema: <#T##String#>)

        for numberOfActions in [1, 3, 20, 100] {
            var actions = [KittyAction]()
            for _ in 0...numberOfActions {
                actions.append(KittyAction.random())
            }
            
            
            for action in actions {
                let actionAvro = try!avro.encode(action)
            }
            
        }
        
    }
    
}
