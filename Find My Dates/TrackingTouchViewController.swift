//
//  TrackingTouchViewController.swift
//  Find My Dates
//
//  Created by xietao on 2017/7/19.
//  Copyright © 2017年 xietao3. All rights reserved.
//

import UIKit

class TrackingTouchViewController: UIViewController {

    @IBOutlet weak var cardView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func transform(for translation: CGPoint) -> CGAffineTransform {
        let moveBy = CGAffineTransform(translationX:translation.x, y: translation.y)
        let rotation = -sin(translation.x/(cardView.frame.width * 4.0))
        return moveBy.rotated(by: rotation)
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: view)
            cardView.transform = transform(for: translation)
        case .ended:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [], animations: {
                self.cardView.transform = .identity
            }, completion: nil)
        default:
            break;
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
