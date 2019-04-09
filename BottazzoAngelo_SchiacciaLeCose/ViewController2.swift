//
//  ViewController2.swift
//  BottazzoAngelo_SchiacciaLeCose
//
//  Created by Angelo Bot on 09/04/2019.
//  Copyright © 2019 Angelo Bot. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        PartiTimer()
    }
    

    @IBOutlet weak var btnDaPremere: UIButton!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var lblStatistiche: UILabel!
    var timer : Timer?
    var latoCosino : CGFloat = 100
    var livello = 1.0;
    var erroriRimasti = 3;
    
    func PartiTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2/livello, target: self, selector: #selector(ViewController2.CoseDelTimer), userInfo: nil, repeats: true)
    }
    @objc func CoseDelTimer(){
        erroriRimasti -= 1
        if erroriRimasti<=0 {
            PersaPartita()
        }
        AggiornaStatistiche()
        CambiaPosizionePulsante()
    }
    
    func CambiaPosizionePulsante(){
        
        let larghezzaSchermo = view.frame.width
        let altezzaSchermo = view.frame.height
        
        btnDaPremere.frame = CGRect(origin: CGPoint(x: CGFloat(arc4random()%UInt32(larghezzaSchermo-latoCosino)), y: CGFloat(arc4random()%UInt32(altezzaSchermo-latoCosino))), size: CGSize(width: latoCosino, height: latoCosino))
    }
    
    func RipartiTimer(){
        timer?.invalidate()
        CambiaPosizionePulsante()
        PartiTimer()
    }
    
    @IBAction func BtnDaPremerePremuto(_ sender: Any) {
        livello = livello + 0.1
        RipartiTimer()
        AggiornaStatistiche()
    }
    
    func AggiornaStatistiche(){
        lblStatistiche.text = erroriRimasti.description;
    }
    
    func PersaPartita(){
        timer?.invalidate()
        
        let alert = UIAlertController(title: "Oh no!", message: "Hai lasciato scappare troppe creature del Sottosopra", preferredStyle: .actionSheet)
        
        
        alert.addAction(UIAlertAction(title: "Torna indietro", style: .default, handler:  {
            action in
            //Mettere che torni indietro
        }))
        
        alert.addAction(UIAlertAction(title: "Riprova", style: .cancel, handler: {
            action in
            self.Riparti()
        }))
        
        self.present(alert, animated: true)
    }
    
    
    func NavigaA(Dove : UIViewController){
        
        
    }
    
    func Riparti(){
        livello = 1.0;
        erroriRimasti = 3;
        PartiTimer()
        CambiaPosizionePulsante()
    }
    
}
