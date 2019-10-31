//
//  ViewController.swift
//  DrawingApp
//
//  Created by Pallavi Srikhakollu on 29/10/19.
//  Copyright © 2019 Pallavi Srikhakollu. All rights reserved.
//

import UIKit


class DrawingViewController: UIViewController {

    @IBOutlet weak var drawingView: CanvasView!
    
    let colors = [UIColor.black.cgColor, UIColor.red.cgColor, UIColor.blue.cgColor,UIColor.yellow.cgColor]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func buttonActionClear(_ sender: Any)
    {
        drawingView.clear()
    }
    
    @IBAction func buttonActionColorSelection(_ sender: Any)
    {
        guard let selectedButton = sender as? UIButton else{
            return
        }
        let colorIndex:Int = selectedButton.tag
        drawingView.setStrokeColor(self.colors[colorIndex])
    }
}

