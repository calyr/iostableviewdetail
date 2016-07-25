//
//  LibrosController.swift
//  NuevoTableView
//
//  Created by Roberto Carlos Callisaya Mamani on 7/22/16.
//  Copyright © 2016 Roberto Carlos Callisaya Mamani. All rights reserved.
//

import UIKit

var toDoItems : [Libro] = []

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
            
 let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! Celda
        cell.titulo.text = toDoItems[indexPath.row].titulo
        return cell
    }
    
    internal override func viewWillAppear(animated: Bool) {
        tableBooks?.reloadData()
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if( segue.identifier == "DetailView"){
            print("Se presiono el boton de detalle")
            let detailView = segue.destinationViewController as! DetailViewController
            
            if let selectedBookCel = sender as? Celda {
                let indexPath = tableView.indexPathForCell(selectedBookCel)!
                print(indexPath.row)
                print(toDoItems)
                detailView.index = indexPath.row
                //!.text = toDoItems[indexPath.row].titulo
                //detailView.autores.text = toDoItems[indexPath.row].autores
                //detailView.isnb.text = toDoItems[indexPath.row].isnb
                //detailView.cover.image = toDoItems[indexPath.row].cover.image!
            }
            
            
        }
    }
}
