//
//  LibrosController.swift
//  NuevoTableView
//
//  Created by Roberto Carlos Callisaya Mamani on 7/22/16.
//  Copyright © 2016 Roberto Carlos Callisaya Mamani. All rights reserved.
//

import UIKit

var toDoItems : [String] = []

class LibrosController: UITableViewController {

    @IBOutlet var tableBooks: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDoItems.count
        
    }
    internal override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell{
            
        let cellIdentifier = "CellBook"
        /*
 let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell") as! Celda
        cell.titulo.text = toDoItems[indexPath.row]
        //cell.textLabel?.text = toDoItems[indexPath.row]
 */
            
 let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! Celda
        cell.titulo.text = toDoItems[indexPath.row]
        return cell
    }
    
    internal override func viewWillAppear(animated: Bool) {
        tableBooks?.reloadData()
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if( segue.identifier == "DetailView"){
            print("Se presiono el boton de detalle")
        }
    }
}
