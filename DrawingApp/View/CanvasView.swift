//
//  CanvasView.swift
//  DrawingApp
//
//  Created by Pallavi Srikhakollu on 29/10/19.
//  Copyright © 2019 Pallavi Srikhakollu. All rights reserved.
//

import Foundation
import UIKit
class CanvasView: UIView
{
    var drawings = [Drawing]()
    var selectedColor = UIColor.black.cgColor

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else{
            return
        }
        
        for currentLine in drawings
        {
            context.setStrokeColor(currentLine.strokeColor)
            
            for (i,point) in currentLine.drawingPath.enumerated()
            {
                if i==0
                {
                    context.move(to: point)
                }else{
                    context.addLine(to: point)
                }
            }
            context.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let currentDrawing = Drawing(strokeColor: self.selectedColor)
        
        guard let point = touches.first?.location(in: self) else{
            return
        }
        currentDrawing.addPointToPath(point)
        
        drawings.append(currentDrawing)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        guard let point = touches.first?.location(in: self) else{
            return
        }
        
        guard let currentDrawing = drawings.popLast() else {
            return
        }
        
        //Adding the new touch point to last drawing
        currentDrawing.addPointToPath(point)
        drawings.append(currentDrawing)
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        setNeedsDisplay()
    }
    
    func setStrokeColor(_ strokeColor:CGColor)
    {
        selectedColor = strokeColor
    }
    
    func clear()
    {
        drawings = [Drawing]()
        setNeedsDisplay()
    }
}
