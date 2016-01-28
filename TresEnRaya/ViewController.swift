//
//  ViewController.swift
//  TresEnRaya
//
//  Created by DoApps on 1/27/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var endGame = 0
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winning = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func secondAction(sender: AnyObject) {
        var currentImage = UIImage()
        if gameState[sender.tag - 1] == 0 {
            if activePlayer == 1{
                currentImage = UIImage(named: "img_circle")!
                activePlayer = 2
            }else{
                currentImage = UIImage(named: "img_cruz")!
                activePlayer = 1
            }
            gameState[sender.tag - 1] = activePlayer
            sender.setImage(currentImage, forState: .Normal)
            endGame++
            
            for combination in winning{
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    self.showAlert("Ganaste!!!")
                }
                if endGame == 9 {
                    self.showAlert("Termino el juego, nadie gano CP!!!")
                }
                
            }
        }
    }
    
    // MARK: cleanTable
    func cleanTable(){
        endGame = 0
    
        for i in 1..<10{
            let tempBUtton = self.view.viewWithTag(i) as! UIButton
            tempBUtton.setImage(nil, forState: .Normal)
        }
        for i in 0..<gameState.count{
            gameState[i] = 0
        }
    }
    
    func showAlert(customMessage:String){
        let alertController = UIAlertController(title: "3 en Raya", message: customMessage, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "Aceptar", style: .Default){(alert: UIAlertAction!) -> Void in
            self.cleanTable()
        }
        
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)

    }
    
}

