//
//  SecondViewController.swift
//  Object Methology
//
//  Created by Timofey on 9/29/17.
//  Copyright © 2017 NFO. All rights reserved.
//

import Cocoa
import AVFoundation

class SecondViewController: NSViewController {
    
    var carView: NSView = NSView()
    var creditCardView: NSView = NSView()
    var purchasesView: NSView = NSView()
    var dollarView: NSView = NSImageView(image: #imageLiteral(resourceName: "money"))

    
    let startTime = 4.0
    let corruptionDuration = 1.0
    
    var playerLayer: AVPlayerLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.white.cgColor
        

        
    }
    
    override func viewDidAppear() {

        let videoURL: URL = Bundle.main.url(forResource: "vid", withExtension: "mov")!
        let player = AVPlayer.init(playerItem: AVPlayerItem.init(asset: AVAsset.init(url: videoURL)))
        playerLayer = AVPlayerLayer(player: player)
        playerLayer!.frame = self.view.bounds
        self.view.layer?.addSublayer(playerLayer!)
        player.play()
    }
    
    func setBasicPositions() {
        
        [carView, creditCardView, purchasesView].forEach {
            $0.wantsLayer = true
            $0.layer?.cornerRadius = 5
            $0.layer?.backgroundColor = NSColor.lightGray.cgColor
            view.addSubview($0)
        }
        
        carView.frame = NSRect(x: 20, y: 300, width: 159, height: 40)
        creditCardView.frame = NSRect(x: 720, y: 300, width: 159, height: 40)
    }
    
    func corruptCarAndCard() {
        carToCenter()
        cardToCenter()
    }
    
    func animateDollar() {
        dollarView.wantsLayer = true
        dollarView.alphaValue = 1
        
        dollarView.frame = CGRect(x: 400, y: 300, width: 50, height: 50)
        
        view.addSubview(dollarView, positioned: .below, relativeTo: nil)
        
        let cardPosAnim = CAKeyframeAnimation()
        let cardOrigin = dollarView.frame.origin
        cardPosAnim.values = [
            cardOrigin,
            CGPoint(x: cardOrigin.x, y: cardOrigin.y + 50),
        ]
        cardPosAnim.keyTimes = [
            5,
            7,

        ]
        
        cardPosAnim.timingFunctions = [CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear),
                                       CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear),
      
        ]
        
        
        
        //        cardPosAnim.autoreverses = true
        //        cardPosAnim.repeatCount = Float.greatestFiniteMagnitude
        
        var existingAnimations = dollarView.animations
        existingAnimations["frameOrigin"] = cardPosAnim
        dollarView.animations = existingAnimations
        
        dollarView.animator().frame = CGRect(x: cardOrigin.x, y: cardOrigin.y + 50, width: 50, height: 50)
    }
    
    func hideCardAndDolalr() {
        
    }
    
    func showPurchases() {
        
    }
    
    func putCarIntoPurchases() {
        
    }
    
    func carToCenter() {
        let carPosAnim = CAKeyframeAnimation()
        let carOrigin = carView.frame.origin
        carPosAnim.values = [
            carOrigin,
            CGPoint(x: carOrigin.x + 270, y: carOrigin.y),
            CGPoint(x: carOrigin.x + 270 - 5, y: carOrigin.y),
            CGPoint(x: carOrigin.x + 270, y: carOrigin.y)
        ]
        carPosAnim.keyTimes = [
            0,
            1,
            1.2,
            1.4
        ]
        
        carPosAnim.timingFunctions = [CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear),
                                      CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear),
                                      CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn),
                                      CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn),
        ]
//
//        carPosAnim.autoreverses = true
//        carPosAnim.repeatCount = Float.greatestFiniteMagnitude
        
        var existingAnimations = carView.animations
        existingAnimations["frameOrigin"] = carPosAnim
        carView.animations = existingAnimations
        
        carView.animator().frame = CGRect(x: carOrigin.x + 275 - 4, y: carOrigin.y, width: 159, height: 40)
    }
    
    func cardToCenter() {
        let cardPosAnim = CAKeyframeAnimation()
        let cardOrigin = creditCardView.frame.origin
        cardPosAnim.values = [
            cardOrigin,
            CGPoint(x: cardOrigin.x - 270, y: cardOrigin.y),
            CGPoint(x: cardOrigin.x - 270 + 5, y: cardOrigin.y),
            CGPoint(x: cardOrigin.x - 270, y: cardOrigin.y)
        ]
        cardPosAnim.keyTimes = [
            0,
            1,
            1.2,
            1.4
        ]
        
        cardPosAnim.timingFunctions = [CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear),
                                      CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear),
                                      CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn),
                                      CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn),
        ]
        
//        cardPosAnim.autoreverses = true
//        cardPosAnim.repeatCount = Float.greatestFiniteMagnitude
        
        var existingAnimations = creditCardView.animations
        existingAnimations["frameOrigin"] = cardPosAnim
        creditCardView.animations = existingAnimations
        
        creditCardView.animator().frame = CGRect(x: cardOrigin.x - 275 + 5, y: cardOrigin.y, width: 159, height: 40)
    }
    
}
