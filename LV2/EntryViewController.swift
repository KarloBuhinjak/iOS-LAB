//
//  EntryViewController.swift
//  LV2-strucni
//
//  Created by Ivan Barisic on 06.05.2022..
//

import UIKit

class EntryViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imeLabel: UILabel!
    @IBOutlet weak var prezimeLabel: UILabel!
    @IBOutlet weak var imeTextField: UITextField!
    @IBOutlet weak var prezimeTextField: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var showBtn: UIButton!
    
    // MARK: - Variables
    var studenti: Array<Student> = Array()
    var student: Student!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imeLabel.text = "Ime:"
        prezimeLabel.text = "Prezime:"
        
        createBtn.setTitle("Novi student", for: .normal)
        showBtn.setTitle("Prikazi studente", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetaljiViewController
        
        vc.naslov = "Odabrani student"
        vc.student = student
        
        
        
    }
    

    // MARK: - Actions
    @IBAction func onTapCreateBtn(_ sender: Any) {
        guard let ime = imeTextField.text, ime.count > 3 else {return}
        guard let prezime = prezimeTextField.text, prezime.count > 3 else {return}
        
        studenti.append(Student(ime: ime, prezime: prezime))
        imeTextField.text = nil
        prezimeTextField.text = nil
    }
    
    @IBAction func onTapShowBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "Lista studenata", message: nil, preferredStyle: .actionSheet)
        
        for student in studenti {
            var actionTitle = "\(student.ime) \(student.prezime)"
            if student.polozio {
                actionTitle += " - Polozio"
            }
            self.student = student
            let studentAction = UIAlertAction(title: actionTitle, style: .default) { _ in
                student.polozio = !student.polozio
                self.performSegue(withIdentifier: "details", sender: nil)
            }
            alert.addAction(studentAction)
        }
        
        alert.addAction(UIAlertAction(title: "Odustani", style: .cancel))
        present(alert, animated: true)
        
    }
}

