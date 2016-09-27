//
//  ViewController.swift
//  ticTacToe
//
//  Created by Johann Kerr on 9/26/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var xOrO = true
    var someoneWon = false
    var gameStarted = false
    var playingVsComputer = false
    var virtualBoard = ["U", "U", "U", "U", "U", "U", "U", "U", "U"]
    var moveCounter = 0
    var gamePieces = [String : [UILabel]]()
    var gameButtons = [UIButton]()
    
    
    // Home Screen //
    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var playerVPlayerButton: UIButton!
    @IBOutlet weak var playerVComputerButton: UIButton!
    @IBOutlet weak var ticTacToeLabel: UILabel!
    
    // Board Buttons //
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topCenterButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var centerLeftButton: UIButton!
    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var rightCenterButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomCenterButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    // Xs and Os //
    @IBOutlet weak var topLeftX: UILabel!
    @IBOutlet weak var topLeftO: UILabel!
    @IBOutlet weak var topCenterO: UILabel!
    @IBOutlet weak var topCenterX: UILabel!
    @IBOutlet weak var topRightO: UILabel!
    @IBOutlet weak var topRightX: UILabel!
    @IBOutlet weak var leftCenterO: UILabel!
    @IBOutlet weak var leftCenterX: UILabel!
    @IBOutlet weak var centerO: UILabel!
    @IBOutlet weak var centerX: UILabel!
    @IBOutlet weak var centerRightO: UILabel!
    @IBOutlet weak var centerRightX: UILabel!
    @IBOutlet weak var bottomLeftO: UILabel!
    @IBOutlet weak var bottomLeftX: UILabel!
    @IBOutlet weak var bottomCenterO: UILabel!
    @IBOutlet weak var bottomCenterX: UILabel!
    @IBOutlet weak var bottomRightO: UILabel!
    @IBOutlet weak var bottomRightX: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    
    func populateGamePiecesDictionaryAndButtonArray() {
        gamePieces["x"] = [topLeftX, topCenterX, topRightX, leftCenterX, centerX, centerRightX, bottomLeftX, bottomCenterX, bottomRightX]
        gamePieces["o"] = [topLeftO, topCenterO, topRightO, leftCenterO, centerO, centerRightO, bottomLeftO, bottomCenterO, bottomRightO]
        gameButtons = [topLeftButton, topCenterButton, topRightButton, centerLeftButton, centerButton, rightCenterButton, bottomLeftButton, bottomCenterButton, bottomRightButton]
    
    }
    
    @IBAction func playAgainButton(_ sender: AnyObject) {
        gameStarted = false
        hideHomeScreen(x: gameStarted)
        viewDidLoad()
    }
    
    @IBAction func playerVPlayerButton(_ sender: AnyObject) {
        gameStarted = true
        hideHomeScreen(x: gameStarted)
    }
    
    @IBAction func playerVComputerButton(_ sender: AnyObject) {
        playingVsComputer = true
        gameStarted = true
        playingVsComputer = true
        hideHomeScreen(x: gameStarted)
    }
    
    
    @IBAction func topLeftButton(_ sender: AnyObject) {
        print("sender tag \(sender.tag)")
        let indexOfClickedButton = sender.tag
        let xO = selectedSegment(indexOfButton: indexOfClickedButton!)
        updateVirtualBoard(index: indexOfClickedButton!, xO: xO)
        updateComputerMove()
    }
    
    @IBAction func topCenterButton(_ sender: AnyObject) {
        print ("sender tag \(sender.tag)")
        let xO = buttonClicked(x: topCenterX, o: topCenterO)
        updateVirtualBoard(index: 1, xO: xO)
        updateComputerMove()
        let index = topCenterButton.tag
        print("tag return int: \(index)")
    }
    
    @IBAction func topRightButton(_ sender: AnyObject) {
        let xO = buttonClicked(x: topRightX, o: topRightO)
        updateVirtualBoard(index: 2, xO: xO)
        updateComputerMove()
    }
    
    @IBAction func leftCenterButton(_ sender: AnyObject) {
        let xO = buttonClicked(x: leftCenterX, o: leftCenterO)
        updateVirtualBoard(index: 3, xO: xO)
        updateComputerMove()
    }
    
    @IBAction func centerButton(_ sender: AnyObject) {
        let xO = buttonClicked(x: centerX, o: centerO)
        updateVirtualBoard(index: 4, xO: xO)
        updateComputerMove()
    }
    
    @IBAction func rightCenterButton(_ sender: AnyObject) {
        let xO = buttonClicked(x: centerRightX, o: centerRightO)
        updateVirtualBoard(index: 5, xO: xO)
        updateComputerMove()
    }
    
    @IBAction func bottomLeftButton(_ sender: AnyObject) {
        let xO = buttonClicked(x: bottomLeftX, o: bottomLeftO)
        updateVirtualBoard(index: 6, xO: xO)
        updateComputerMove()
    }
    
    @IBAction func bottomCenterButton(_ sender: AnyObject) {
        let xO = buttonClicked(x: bottomCenterX, o: bottomCenterO)
        updateVirtualBoard(index: 7, xO: xO)
        updateComputerMove()
    }
    
    @IBAction func bottomRightButton(_ sender: AnyObject) {
        let xO = buttonClicked(x: bottomRightX, o: bottomRightO)
        updateVirtualBoard(index: 8, xO: xO)
        updateComputerMove()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideXsAndOs(x: true)
        hideBoardButtons(x: false)
        someoneWon = false
        winnerLabel.isHidden = true
        virtualBoard = ["U", "U", "U", "U", "U", "U", "U", "U", "U"]
        xOrO = true
        playingVsComputer = false
        playAgain.isHidden = true
        moveCounter = 0
        populateGamePiecesDictionaryAndButtonArray()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideXsAndOs(x: Bool) {
        topLeftO.isHidden = x
        topLeftX.isHidden = x
        topCenterO.isHidden = x
        topCenterX.isHidden = x
        topRightO.isHidden = x
        topRightX.isHidden = x
        leftCenterO.isHidden = x
        leftCenterX.isHidden = x
        centerO.isHidden = x
        centerX.isHidden = x
        centerRightO.isHidden = x
        centerRightX.isHidden = x
        bottomLeftO.isHidden = x
        bottomLeftX.isHidden = x
        bottomCenterO.isHidden = x
        bottomCenterX.isHidden = x
        bottomRightO.isHidden = x
        bottomRightX.isHidden = x
    }
    
    
    func buttonClicked(x: UILabel, o: UILabel) -> String {
        var xO = ""
        if xOrO && o.isHidden {
            x.isHidden = false
            xOrO = false
            xO = "x"
        } else if !xOrO && x.isHidden {
            o.isHidden = false
            xOrO = true
            xO = "o"
        }
        return xO
    }
    
    func selectedSegment(indexOfButton index: Int) -> String {
        let xPiece = gamePieces["x"]?[index]
        let oPiece = gamePieces["o"]?[index]
        //let buttonPiece = gameButtons[index]
        return buttonClicked(x: xPiece!, o: oPiece!)
    }
    
    func updateVirtualBoard(index: Int, xO: String) {
        virtualBoard[index] = xO
        checkForWinner(xO: "x")
        checkForWinner(xO: "o")
        moveCounter += 1
        print("Move counter \(moveCounter)")
    }
    
    func checkForWinner(xO: String) {
        if
            // Across //
            virtualBoard[0] == xO && virtualBoard[1] == xO && virtualBoard[2] == xO ||
            virtualBoard[3] == xO && virtualBoard[4] == xO && virtualBoard[5] == xO ||
            virtualBoard[6] == xO && virtualBoard[7] == xO && virtualBoard[8] == xO ||
            // Down //
            virtualBoard[0] == xO && virtualBoard[3] == xO && virtualBoard[6] == xO ||
            virtualBoard[1] == xO && virtualBoard[4] == xO && virtualBoard[7] == xO ||
            virtualBoard[2] == xO && virtualBoard[5] == xO && virtualBoard[8] == xO ||
            // Diagonal //
            virtualBoard[2] == xO && virtualBoard[4] == xO && virtualBoard[6] == xO ||
            virtualBoard[0] == xO && virtualBoard[4] == xO && virtualBoard[8] == xO {
            winnerLabel.text = "\(xO.capitalized) Wins!"
            winnerLabel.isHidden = false
            playAgain.isHidden = false
            someoneWon = true
            hideBoardButtons(x: someoneWon)
        }
        
        if moveCounter == 9 && !someoneWon {
            winnerLabel.text = "DRAW!"
            winnerLabel.isHidden = false
            playAgain.isHidden = false
            someoneWon = true
            hideBoardButtons(x: someoneWon)
        }
    
    }
    
    func hideBoardButtons (x: Bool) {
        topLeftButton.isHidden = x
        topCenterButton.isHidden = x
        topRightButton.isHidden = x
        centerLeftButton.isHidden = x
        centerButton.isHidden = x
        rightCenterButton.isHidden = x
        bottomLeftButton.isHidden = x
        bottomCenterButton.isHidden = x
        bottomRightButton.isHidden = x
    }
    
    func hideHomeScreen(x: Bool) {
        viewOutlet.isHidden = x
        playerVPlayerButton.isHidden = x
        playerVComputerButton.isHidden = x
        ticTacToeLabel.isHidden = x
    }
    
    func computerMove () {
        var computerMoveOptions: [Int] = []
        for (index, item) in virtualBoard.enumerated() {
            if item == "U" {
                computerMoveOptions.append(index)
            }
        }
        
        if !computerMoveOptions.isEmpty {
            let randomIndex = arc4random_uniform(UInt32(computerMoveOptions.count))
            let randomMove = computerMoveOptions[Int(randomIndex)]
            print(randomIndex)
            print(randomMove)
            
            switch randomMove {
            case 0:
                let xO = buttonClicked(x: topLeftX, o: topLeftO)
                updateVirtualBoard(index: 0, xO: xO)
                break
            case 1:
                let xO = buttonClicked(x: topCenterX, o: topCenterO)
                updateVirtualBoard(index: 1, xO: xO)
                break
            case 2:
                let xO = buttonClicked(x: topRightX, o: topRightO)
                updateVirtualBoard(index: 2, xO: xO)
                break
            case 3:
                let xO = buttonClicked(x: leftCenterX, o: leftCenterO)
                updateVirtualBoard(index: 3, xO: xO)
                break
            case 4:
                let xO = buttonClicked(x: centerX, o: centerO)
                updateVirtualBoard(index: 4, xO: xO)
                break
            case 5:
                let xO = buttonClicked(x: bottomLeftX, o: bottomLeftO)
                updateVirtualBoard(index: 5, xO: xO)
                break
            case 6:
                let xO = buttonClicked(x: bottomLeftX, o: bottomLeftO)
                updateVirtualBoard(index: 6, xO: xO)
                break
            case 7:
                let xO = buttonClicked(x: bottomCenterX, o: bottomCenterO)
                updateVirtualBoard(index: 7, xO: xO)
                break
            case 8:
                let xO = buttonClicked(x: bottomRightX, o: bottomRightO)
                updateVirtualBoard(index: 8, xO: xO)
                break
            default:
                break
                
            }
        }
        print(virtualBoard)
        
    }
    
    func updateComputerMove () {
        if playingVsComputer == true {
            computerMove()
        }
    }
  
    
}

