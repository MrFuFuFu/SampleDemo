//
//  Extensions.swift
//  TradeMeTest
//
//  Created by Yuan on 20/01/22.
//

import UIKit

extension UIViewController {
    func alert(msg: String) {
        let alertView = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(doneAction)
        self.present(alertView, animated: true, completion: nil)
    }
}
