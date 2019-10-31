//
//  Drawing.swift
//  DrawingApp
//
//  Created by Pallavi Srikhakollu on 30/10/19.
//  Copyright © 2019 Pallavi Srikhakollu. All rights reserved.
//

import Foundation
import UIKit

class Drawing
{
    var drawingPath: [CGPoint]!
    var strokeColor: CGColor!
    var strokeWidth: CGFloat!
    
    init(strokeColor: CGColor = UIColor.black.cgColor, strokeWidth: CGFloat = 1.0)
    {
        self.drawingPath = [CGPoint]()
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
    }
    
    func addPointToPath(_ point: CGPoint)
    {
        self.drawingPath.append(point)
    }
}
