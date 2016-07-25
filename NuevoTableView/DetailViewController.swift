//
//  DetailViewController.swift
//  NuevoTableView
//
//  Created by Roberto Carlos Callisaya Mamani on 7/25/16.
//  Copyright © 2016 Roberto Carlos Callisaya Mamani. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var isnb: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var autores: UILabel!
    @IBOutlet weak var cover: UIImageView!
    var index = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        isnb.text = toDoItems[index].isnb
        titulo.text = toDoItems[index].titulo
        autores.text = toDoItems[index].autores
        cover.image = toDoItems[index].cover.image
        print("El index es\(index)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
