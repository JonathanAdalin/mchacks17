//
//  ViewController.swift
//  mchacks17
//
//  Created by Jonathan Adalin on 2017-01-28.
//  Copyright © 2017 Jonathan Adalin. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("the console is here!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CreateAccount(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: Username.text!, password: Password.text!, completion: {
            user, error in
            
            if error != nil { // if there is an error
                // if account has already been created
                self.login()
            }
            else{
                print("User Created")
                self.login()
            }
        })
    }
    
    func login(){
        FIRAuth.auth()?.signIn(withEmail: Username.text!, password: Password.text!, completion: {
            user, error in
            if error != nil {
                print("Incorrect password/username")
            } else {
                print("You logged in!")
            }
        })
    }

}

