//
//  ViewController.swift
//  Silly Song2
//
//  Created by Malati Batchu on 1/4/18.
//  Copyright © 2018 Malati Batchu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    
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
        nameField.autocapitalizationType = UITextAutocapitalizationType.words
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        let name = nameField.text
        let lyrics = lyricsForName(bananaFanaTemplate, fullName: name!)
        lyricsView.text = lyrics
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameForName(_ name: String) -> String {
    let lowercaseName = name.lowercased()
    var shortName = lowercaseName
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    if let range = lowercaseName.rangeOfCharacter(from: vowelSet) {
        shortName = String(lowercaseName[range.lowerBound...])
    }
    return shortName
}

func lyricsForName(_ lyricsTemplate: String, fullName: String) -> String {
    var lyrics = lyricsTemplate
    let shortName = shortNameForName(fullName)
    lyrics = lyrics.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    lyrics = lyrics.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return lyrics
}
