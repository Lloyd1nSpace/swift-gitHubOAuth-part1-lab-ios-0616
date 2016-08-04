//
//  LoginViewController.swift
//  GitHubOAuth
//
//  Created by Joel Bell on 7/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import Locksmith
import SafariServices

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var imageBackgroundView: UIView!
    
    let numberOfOctocatImages = 10
    var octocatImages: [UIImage] = []
    var safariController: SFSafariViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpImageViewAnimation()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(safariLogin), name: "value", object: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if imageBackgroundView.layer.cornerRadius == 0 {
            configureButton()
        }
    }
    
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
        let urlString = GitHubAPIClient.URLRouter.oauth
        let url = NSURL(string: urlString)
        if let url = url {
            safariController = SFSafariViewController.init(URL: url)
            self.presentViewController(safariController, animated: true, completion: nil)
        }
    }
}


// MARK: Set Up View
extension LoginViewController {
    
    private func configureButton()
    {
        self.imageBackgroundView.layer.cornerRadius = 0.5 * self.imageBackgroundView.bounds.size.width
        self.imageBackgroundView.clipsToBounds = true
    }
    
    private func setUpImageViewAnimation() {
        
        for index in 1...numberOfOctocatImages {
            if let image = UIImage(named: "octocat-\(index)") {
                octocatImages.append(image)
            }
        }
        
        self.loginImageView.animationImages = octocatImages
        self.loginImageView.animationDuration = 2.0
        self.loginImageView.startAnimating()
        
    }
    
    func safariLogin(notifacation: NSNotification) {
        
        let absoluteURL = notifacation.object?.absoluteURL
        print(absoluteURL)
        safariController.dismissViewControllerAnimated(true, completion: nil)
    }
}