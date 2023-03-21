//
//  ViewController.swift
//  proto-auto-resize-textview-ios
//
//  Created by Santosh Krishnamurthy on 3/21/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        textView.backgroundColor = .yellow
        textView.text = "This is a long line of test that is preset. Lets see how this shows"
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        // when autolayout is applied, the textView height is set to 0
        // we must set the height to see the textView
        textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        textView.delegate = self
        // too autoresize we need to disable scrolling
        textView.isScrollEnabled = false
        // call this method if yoou have text already in the boox that need to be displayed and box resized
        textViewDidChange(textView)
        
        print(textView.frame)
    }


}

extension ViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        let textViewSize = CGSize(width: view.frame.width-20, height: .infinity)
        let estimatedSize = textView.sizeThatFits(textViewSize)
        print(estimatedSize)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == NSLayoutConstraint.Attribute.height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}

