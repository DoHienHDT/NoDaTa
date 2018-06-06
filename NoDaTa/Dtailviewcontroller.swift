//
//  ViewController.swift
//  NoDaTa
//
//  Created by dohien on 5/30/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

class Dtailviewcontroller: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    var Data : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if Data != nil {
            nameTextField.text = Data
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Data = nameTextField.text
    }
}

