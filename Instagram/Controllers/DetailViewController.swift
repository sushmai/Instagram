//
//  DetailViewController.swift
//  Instagram
//
//  Created by Sanaz Khosravi on 10/3/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {

    
    @IBOutlet var timeStampLabel: UILabel!
    @IBOutlet var detailCaptionLabel: UILabel!
    @IBOutlet var detailImageView: UIImageView!
    var post : Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailImageView.image = UIImage(named: "image_placeholder.png")!
        loadPostDetail()
    }
    
    func loadPostDetail() {
        if let imageFile : PFFile = post?.media {
            imageFile.getDataInBackground { (data, error) in
                if (error != nil) {
                    self.detailImageView.image = UIImage(named: "image_placeholder.png")!
                }
                else {
                    self.detailImageView.image = UIImage(data: data!)
                }
            }
            if (post?.caption == ""){
               detailCaptionLabel.text = "No caption is set for this post."
            }else{
                detailCaptionLabel.text = post?.caption
            }
            timeStampLabel.text = formatDateString((post?.createdAt)!)
        }
    }
    
    func formatDateString(_ date : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        let result = formatter.string(from: date)
        return result
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
