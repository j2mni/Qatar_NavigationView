//
//  DetailViewController.swift
//  Qatar2022_Navigation
//
//  Created by yeonji on 2022/10/18.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var lblGroup: UILabel!
    @IBOutlet weak var lblName: UILabel!
    var nation:Nation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nation = nation {
            lblName.text = nation.name
            lblGroup.text = "Group \(nation.group)"
            imageFlag.image = UIImage(named: nation.flag)
            txtDesc.text = nation.description
        }
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
