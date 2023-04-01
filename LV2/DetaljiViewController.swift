//
//  DetaljiViewController.swift
//  LV2-strucni
//
//  Created by Karlo Buhinjak on 27.03.2023..
//

import UIKit

class DetaljiViewController:
    
    UIViewController {
    
    @IBOutlet weak var ime: UILabel!
    @IBOutlet weak var prezime: UILabel!
    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var polozio: UILabel!
    @IBOutlet weak var button1: UIButton!
    var naslov: String = ""
    var imeLabel: String = ""
    var student: Student!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = naslov
        ime.text = student.ime
        prezime.text = student.prezime
        id.text = student.id
    
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func onTap(_ sender: Any) {
        
        student.polozio = !student.polozio
        polozio.text = String( student.polozio)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
