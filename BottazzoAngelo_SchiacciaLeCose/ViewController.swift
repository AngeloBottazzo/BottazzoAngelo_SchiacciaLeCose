//
//  ViewController.swift
//  BottazzoAngelo_SchiacciaLeCose
//
//  Created by Angelo Bot on 02/04/2019.
//  Copyright © 2019 Angelo Bot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true // per refreshare continuamente lo schermo altrimenti avrei problemi col simulatore
        
        //self.navigationController?.isNavigationBarHidden = true
        //UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)//per resettare dati
        
        RiempiRecord()
        
    }
    @IBOutlet weak var lblNickMax: UILabel!
    @IBOutlet weak var lblPuntiMax: UILabel!
    @IBOutlet weak var BoxNickOut: UITextField!
    @IBOutlet weak var btnCominciaOut: UIButton!
    
    @IBAction func BoxNick(_ sender: UITextField) {
        if sender.text!.count<1{
            btnCominciaOut.isEnabled = false
        }else{
            btnCominciaOut.isEnabled = true
        }
        
        Dati.nickname = sender.text!
        UserDefaults.standard.set(Dati.nickname, forKey: "ultimoNick")
    }
    
    func RiempiRecord() {
        if let nick = UserDefaults.standard.string(forKey:"nickMax")
        {
            lblNickMax.text = nick
            lblPuntiMax.text = UserDefaults.standard.integer(forKey:"puntiMax").description
        }else{
            lblNickMax.text="Gioca per primo!"
            lblPuntiMax.text=""
        }
        
        
        let ultimoNick = UserDefaults.standard.string(forKey:"ultimoNick") ?? "primo"
        BoxNickOut.text = ultimoNick
        Dati.nickname = ultimoNick
    }
}

