//
//  ViewController.swift
//  Parser
//
//  Created by Valerio Ferrucci on 25/09/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ParserDelegate {

    @IBOutlet weak var textView: UITextView!
    let parser = Parser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        parser.delegate = self
        parser.start()
    }
    
    
    //MARK: ParserDelegate
    func parserOK(photos : [Photo]) {
        
        textView.text = photos.description
    }
    
    func parserKO(error : NSError) {
        
        println(error.localizedDescription)

        // Attenzione, questa alert è solo iOS8
        let alert:UIAlertController = UIAlertController(title: "Errore", message: error.localizedDescription, preferredStyle:.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
            
        }))
        self.presentViewController(alert, animated:true, completion:nil);
    }

}

