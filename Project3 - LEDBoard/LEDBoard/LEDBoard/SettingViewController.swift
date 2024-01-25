//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by 송승호 on 2024/01/25.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedColor(text: String?, textColor: UIColor, backColor: UIColor)
}
    
class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    var textColor: UIColor = .yellow
    var backColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

    }
    
    private func configureView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackColor(color: self.backColor)
    }
    
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        if sender == self.yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.orangeButton {
            self.changeTextColor(color: .orange)
            self.textColor = .orange
        } else {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        }
    }
    
    @IBAction func tabBackColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackColor(color: .black)
            self.backColor = .black
        } else if sender == self.greenButton {
            self.changeBackColor(color: .green)
            self.backColor = .green
        } else {
            self.changeBackColor(color: .blue)
            self.backColor = .blue
        }
    }
    
    @IBAction func tabSaveButton(_ sender: UIButton) {
        self.delegate?.changedColor(
            text: self.textField.text,
            textColor: self.textColor,
            backColor: self.backColor
        )
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor){
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
    }
    
    private func changeBackColor(color: UIColor){
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
    }
}
