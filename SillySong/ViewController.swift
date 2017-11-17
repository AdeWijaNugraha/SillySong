//
//  ViewController.swift
//  SillySong
//
//  Created by Ade Wija Nugraha on 8/12/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"
        ].joined(separator: "\n")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
    
    func shortNameFromName(name: String) -> String {
        var lowercaseName = name.lowercased()
        
        let vowelSet = CharacterSet(charactersIn: "aeiou")
        
        let rangeCharacters = lowercaseName.rangeOfCharacter(from: vowelSet)
        
        lowercaseName = lowercaseName.substring(from: rangeCharacters!.lowerBound)
        
        print("vowelset: ", vowelSet)
        print("rangechar: ", rangeCharacters)
        print("lowerbound: ", rangeCharacters!.lowerBound)
        
        print("NAME: ", lowercaseName)
        
        return lowercaseName
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        let shortName = shortNameFromName(name: fullName)
        
        let lyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        return lyrics
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
