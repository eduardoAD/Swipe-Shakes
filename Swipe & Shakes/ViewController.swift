//
//  ViewController.swift
//  Swipe & Shakes
//
//  Created by Eduardo Alvarado Díaz on 1/11/16.
//  Copyright © 2016 persnal. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()

    var sounds = ["belch", "giggle", "pew", "pig", "snore", "uuu"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)


    }

    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            print("Device was shaken")

            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))

            let fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")


            do{
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                player.play()
            } catch{
                print("Error playing the file: " + fileLocation!)
            }
        }
    }

    func swiped(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.Right:
                    print("Swipe right")
                case UISwipeGestureRecognizerDirection.Up:
                    print("Swipe up")
                default:
                    break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

