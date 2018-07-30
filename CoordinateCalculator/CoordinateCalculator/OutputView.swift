//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    private static func drawPoints(_ points: [MyPoint]) -> String {
        var result = ""
        points.forEach {
            result += ANSICode.cursor.move(row: $0.pointsForDisplay.y, col: $0.pointsForDisplay.x)
            result += "•"
        }
        print(result)
        return result
    }
    
    private static func drawValue(of line: MyLine ) -> String {
        var result = ""
        result += ANSICode.cursor.move(row: 0, col: -2)
        result += "두 점 사이의 거리는 \(line.valueOfFigure)"
        return result
    }
    
    private static func drawValue(of triangle: MyTriangle) -> String {
        var result = ""
        result += ANSICode.cursor.move(row: 0, col: -2)
        result += "Space : \(triangle.valueOfFigure)"
        return result
    }
    
    static func drawAxis(with points: [MyPoint] ) {
        clear()
        print("\(ANSICode.text.redBright)\(drawPoints(points))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func drawAxis(with line: MyLine) {
        drawAxis(with: line.pointsForDisplay)
        print("\(drawValue(of: line))")
    }
    
    static func drawAxie(with triangle: MyTriangle) {
        drawAxis(with: triangle.pointsForDisplay)
        print("\(drawValue(of: triangle))")
    }
}
