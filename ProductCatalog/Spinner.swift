//
//  Spinner.swift
//  ProductCatalog
//
//  Created by Rupika Sahu on 29/09/20.
//  Copyright © 2020 Rupika Sahu. All rights reserved.
//

import UIKit

var spinnerView: UIView?

extension UIViewController {
    
    func showSpinner(withYOffset: inout CGFloat) {
        if UIDevice.current.hasTopNotch {
            withYOffset += 44
        }
        spinnerView = UIView(frame: CGRect(x: 0.0, y: withYOffset, width: self.view.frame.width, height: self.view.frame.height - withYOffset))
        spinnerView?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.bounds = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        spinner.center.x = self.view.center.x
        spinner.center.y = self.view.center.y - withYOffset
        spinnerView?.addSubview(spinner)
        spinner.bringSubviewToFront(spinnerView ?? self.view)
        spinner.startAnimating()
        self.view.addSubview(spinnerView!)
        spinnerView?.bringSubviewToFront(self.view)
    }
    
    func removeSpinner() {
        spinnerView?.subviews.forEach { $0.removeFromSuperview() }
        spinnerView?.removeFromSuperview()
        spinnerView = nil
    }
   
}

