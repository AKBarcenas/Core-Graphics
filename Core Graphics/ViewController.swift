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

    /*
     * Function Name: viewDidLoad
     * Parameters: None
     * Purpose: This method starts the sequence of drawing by drawing a rectangle.
     * Return Value: None
     */
    
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
            
        case 1:
            drawCircle()
            
        case 2:
            drawCheckerboard()
            
        case 3:
            drawRotatedSquares()
            
        case 4:
            drawLines()
            
        case 5:
            drawImagesAndText()
            
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
    
    /*
     * Function Name: drawCircle
     * Parameters: None
     * Purpose: This method draws a circle and converts it into an image to display in the image view.
     * Return Value: None
     */
    
    func drawCircle() {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        let context = UIGraphicsGetCurrentContext()
        let rectangle = CGRect(x: 5, y: 5, width: 502, height: 502)
        
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 10)
        
        CGContextAddEllipseInRect(context, rectangle)
        CGContextDrawPath(context, .FillStroke)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageView.image = img
    }
    
    /*
     * Function Name: drawCheckerboard
     * Parameters: None
     * Purpose: This method draws a checkerboard and converts it into an image to display in the image view.
     * Return Value: None
     */
    
    func drawCheckerboard() {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        
        for row in 0 ..< 8 {
            for col in 0 ..< 8 {
                if row % 2 == 0 {
                    if col % 2 == 0 {
                        CGContextFillRect(context, CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
                    }
                } else {
                    if col % 2 == 1 {
                        CGContextFillRect(context, CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
                    }
                }
                
            }
        }
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageView.image = img
    }
    
    /*
     * Function Name: drawRotatedSquares
     * Parameters: None
     * Purpose: This method draws rotated squares and converts it into an image to display in the image view.
     * Return Value: None
     */
    
    func drawRotatedSquares() {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, 256, 256)
        
        let rotations = 16
        let amount = M_PI_2 / Double(rotations)
        
        for _ in 0 ..< rotations {
            CGContextRotateCTM(context, CGFloat(amount))
            CGContextAddRect(context, CGRect(x: -128, y: -128, width: 256, height: 256))
        }
        
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextStrokePath(context)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageView.image = img
    }
    
    /*
     * Function Name: drawRotatedSquares
     * Parameters: None
     * Purpose: This method draws lines and converts it into an image to display in the image view.
     * Return Value: None
     */
    
    func drawLines() {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, 256, 256)
        
        var first = true
        var length: CGFloat = 256
        
        for _ in 0 ..< 256 {
            CGContextRotateCTM(context, CGFloat(M_PI_2))
            
            if first {
                CGContextMoveToPoint(context, length, 50)
                first = false
            } else {
                CGContextAddLineToPoint(context, length, 50)
            }
            
            length *= 0.99
        }
        
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextStrokePath(context)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageView.image = img
    }
    
    /*
     * Function Name: drawImagesAndText
     * Parameters: None
     * Purpose: This method places and image and string onto the screen to display in the image view.
     * Return Value: None
     */
    
    func drawImagesAndText() {
        // 1
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        
        // 2
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        
        // 3
        let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 36)!, NSParagraphStyleAttributeName: paragraphStyle]
        
        // 4
        let string = "The best-laid schemes o'\nmice an' men gang aft agley"
        string.drawWithRect(CGRect(x: 32, y: 32, width: 448, height: 448), options: .UsesLineFragmentOrigin, attributes: attrs, context: nil)
        
        // 5
        let mouse = UIImage(named: "mouse")
        mouse?.drawAtPoint(CGPoint(x: 300, y: 150))
        
        // 6
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // 7
        imageView.image = img
    }

}

