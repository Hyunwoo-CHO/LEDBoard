//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by hyun woo cho on 2022/12/02.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var orangeBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
    }
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == self.yellowBtn {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        }
        else if sender == self.purpleBtn {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        }
        else if sender == self.greenBtn {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackBtn {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        }
        else if sender == self.blueBtn {
            self.changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        }
        else if sender == self.orangeBtn {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor) {
        self.yellowBtn.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleBtn.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenBtn.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.blackBtn.alpha = color == UIColor.black ? 1 : 0.2
        self.blueBtn.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeBtn.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
