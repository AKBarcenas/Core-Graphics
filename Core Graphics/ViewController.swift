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

    /*
     * Function Name: redrawTapped
     * Parameters: sender - the button tapped in order to call this method.
     * Purpose: This method handles when the redraw button is tapped by drawing another image to
     *   display in the image view.
     * Return Value: None
     */
    
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
    
    /*
     * Function Name: drawRectangle
     * Parameters: None
     * Purpose: This method draws a rectangle and converts it into an image to display in the image view.
     * Return Value: None
     */
    
    func drawRectangle() {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
        
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 10)
        
        CGContextAddRect(context, rectangle)
        CGContextDrawPath(context, .FillStroke)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageView.image = img
    }

}

