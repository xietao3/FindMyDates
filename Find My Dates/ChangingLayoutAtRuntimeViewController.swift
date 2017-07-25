//
//  ChangingLayoutAtRuntimeViewController.swift
//  Find My Dates
//
//  Created by xietao on 2017/7/18.
//  Copyright © 2017年 xietao3. All rights reserved.
//

import UIKit

class ChangingLayoutAtRuntimeViewController: UIViewController {

    @IBOutlet var warppingView: UIView!
    @IBOutlet var edgeConstraint: NSLayoutConstraint!
    var zeroHeightConstraint : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleDistanceControls(_ sender: Any) {
        if zeroHeightConstraint == nil {
            zeroHeightConstraint = warppingView.heightAnchor.constraint(equalToConstant: 0)
        }
        
        let shouldShow = !edgeConstraint.isActive
        
        if shouldShow {
            zeroHeightConstraint.isActive = false
            edgeConstraint.isActive = true
        }else{
            edgeConstraint.isActive = false
            zeroHeightConstraint.isActive = true
        }
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
        
    }

}
