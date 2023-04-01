//
//  ViewController.swift
//  LV1
//
//  Created by Karlo Buhinjak on 16.03.2023..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var spremiButton: UIButton!
    @IBOutlet weak var unosTextField: UITextField!
    @IBOutlet weak var naslovLabel: UILabel!
    @IBOutlet weak var imeText: UITextField!
    @IBOutlet weak var prezimeText: UITextField!
    @IBOutlet weak var ispišiImeIPrezime: UIButton!
    @IBOutlet weak var ispisiID: UILabel!
    

    var ime: String! = "Karlo"
    var prezime: String = "Buhinjak"
    
    var listaStudenata: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func onTapSpremiIme(_ sender: Any) {

        let noviStudent: Student = Student(ime: ime, prezime: prezime)
        
        var textUnos = unosTextField.text
        
        naslovLabel.text = textUnos
        
    }
    
    
    @IBAction func onTapIspišiID(_ sender: Any) {
        
        var ime: String? = imeText.text
        var prezime: String? = prezimeText.text
        
        let noviStudent: Student = Student(ime: ime!, prezime: prezime!)
        
        ispisiID.text = noviStudent.id
        listaStudenata.append(noviStudent)
        prikaziStudente()
        
        
    }
    
    func spojiImeIPrezime(i: String, p: String) -> String {
        
        return i + " " + p
    }
    
    func prikaziStudente() {
        
        
        
        let alert = UIAlertController(title: "Popis studenata", message: nil, preferredStyle: .actionSheet)
    
        
        for string in listaStudenata {
            var hasPassed: String = ""
                       
                       if(string.passed){
                           hasPassed = "+"
                       } else {
                           hasPassed = "-"
                       }
            
            
            let action = UIAlertAction(title: string.ime + " " + string.prezime + " " + hasPassed , style: .default){
                _ in self.naslovLabel.text = string.id
            }
            string.passed = !string.passed
            alert.addAction(action)
        }
        
     
        

        present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        
        
    }


}

