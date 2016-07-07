//
//  ViewController.swift
//  Core Graphics
//
//  Created by Alex on 7/7/16.
//  Copyright © 2016 Alex Barcenas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // The image view that will display our images.
    @IBOutlet weak var imageView: UIImageView!
    // The current drawing type that will be used.
    var currentDrawType = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawRectangle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redrawTapped(sender: AnyObject) {
        currentDrawType += 1
        
        if currentDrawType > 5 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
            
        default:
            break
        }
    }
    
    func drawRectangle() {
        
    }

}

