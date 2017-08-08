//
//  ViewController.swift
//  ButtonTest
//
//  Created by Jia on 2017/8/9.
//  Copyright © 2017年 Jia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    var isEngineStarted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress)) //Long function will call when user long press on button.
        bButton.addGestureRecognizer(longGesture)
        
        //這裡只要指向同一個 touchDown 即可，為了分辨我分開寫
        aButton.addTarget(self, action: #selector(self.atouchDown), for: .touchDown)
        bButton.addTarget(self, action: #selector(self.btouchDown), for: .touchDown)
    }
    
    func atouchDown() {
        enableUserInteraction(isEnable: false)
        print("Button A touchDown")
    }
    
    func btouchDown() {
        enableUserInteraction(isEnable: false)
        print("Button B touchDown")
    }
    
    @IBAction func aButtonClickEvent(_ sender: Any) {
        print("A IBAction trigger")
        enableUserInteraction(isEnable: true)
    }
    
    @IBAction func bButtonClickEvent(_ sender: Any) {
        print("B IBAction trigger")
        enableUserInteraction(isEnable: true)
    }
    
    func longPress() {
        //即使有 View 擋在上面還是會持續觸發
        print("B Long press")
        
        if (!isEngineStarted) {
            let alert = UIAlertController(title: "提醒", message: "車子發動囉~", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK!", style: UIAlertActionStyle.default, handler: alreadyStartTheEngine))
            self.present(alert, animated: true, completion: { [unowned self] in
                self.isEngineStarted = true
                self.enableUserInteraction()
            })
        }
    }
    
    func enableUserInteraction(isEnable: Bool = true) {
        self.view.isUserInteractionEnabled = isEnable
        if isEnable {
            print("User Interaction Enabled")
        }else{
            print("User Interaction Disable")
        }
    }
    
    func alreadyStartTheEngine(action: UIAlertAction) {
        self.isEngineStarted = false
    }

}

