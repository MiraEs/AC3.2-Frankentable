//
//  FrankenTableViewController.swift
//  Frankentable
//
//  Created by Jason Gresh on 11/26/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class FrankenTableViewController: UITableViewController {
    
    var repeatedWordsAndFreq = [String:Int]()
    var repeatedWords = [String]()
    var frankText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        getText()
        repeatingWords(input: frankText)
        
    }
    
    func getText () {
        if let url = Bundle.main.url(forResource: "Data", withExtension: "txt"),
            let data = try? Data(contentsOf: url),
            let text = String(data: data, encoding: .utf8) {
            // here's your text
            frankText = text
            print(text)
        }
    }
    
    func repeatingWords(input: String) {
        var allTheStuff = CharacterSet()
        allTheStuff.insert(charactersIn: ".,?!()")
        allTheStuff.insert(charactersIn: " ")
        let wordArray = input.lowercased().components(separatedBy: allTheStuff).filter{$0 != ""}
        
        var frequencyDict = [String: Int]()
        
        for word in wordArray {
            frequencyDict[word] = (frequencyDict[word] ?? 0) + 1 //?
        }
        
        let sortedArr = frequencyDict.keys.sorted{frequencyDict[$0]! > frequencyDict[$1]!}

        repeatedWordsAndFreq = frequencyDict
        repeatedWords = sortedArr
        //dump(repeatedWords)
        dump(repeatedWordsAndFreq)
        
    }
  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repeatedWords.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        var arrofRepeats = [(String, Int)]()
        for dict in repeatedWordsAndFreq {
            arrofRepeats.append((dict.key, dict.value))
        }
        
          cell.textLabel?.text = "\(arrofRepeats[indexPath.row].0)  (\(arrofRepeats[indexPath.row].1))"
        
        
        
            //cell.textLabel?.text = repeatedWords[indexPath.row]
        return cell
    }
 


}
