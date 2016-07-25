//
//  ViewController.swift
//  NuevoTableView
//
//  Created by Roberto Carlos Callisaya Mamani on 7/22/16.
//  Copyright © 2016 Roberto Carlos Callisaya Mamani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtIsbn: UITextField!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var autores: UILabel!
    @IBOutlet weak var cover: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buscar(sender: UITextField) {
        asincrono()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func asincrono(){
        var urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        urls = urls+txtIsbn.text!
        let libro = Libro()
            libro.isnb = txtIsbn.text!
        let url = NSURL(string: urls)
        let session = NSURLSession.sharedSession()
        let bloque = { (datos:NSData?, resp : NSURLResponse?,error : NSError?)->Void in
            if error?.code != nil {
                dispatch_sync(dispatch_get_main_queue(), {
                    let alertController = UIAlertController(title: "Error", message:
                        error?.description, preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                })
            } else{
                //let texto = NSString(data:datos!, encoding: NSUTF8StringEncoding)
                dispatch_sync(dispatch_get_main_queue(), {
                    do{
                        let json = try NSJSONSerialization.JSONObjectWithData(datos!,
                            options: NSJSONReadingOptions.MutableLeaves)
                        let dico = json as! NSDictionary
                        if(dico["ISBN:"+self.txtIsbn.text!] != nil){
                            let dico1 = dico["ISBN:"+self.txtIsbn.text!] as! NSDictionary
                            let title = dico1["title"] as! String
                            self.titulo.text = title
                            libro.titulo = title
                            if((dico1["by_statement"]) != nil){
                               // self.results.text = dico1["by_statement"] as! String
                            }
                            else{
                                let authors = dico1["authors"] as! NSArray
                                var author = NSDictionary()
                                var authorsText = ""
                                for(var i=0 ; i < authors.count ; i+=1){
                                    author = authors[i] as! NSDictionary
                                    if(authorsText != "")
                                    {
                                        authorsText += "," + (author["name"] as! String)
                                    }
                                    else{
                                        authorsText += author["name"] as! String
                                    }
                                }
                                self.autores.text = authorsText
                                libro.autores = authorsText
                            }
                            if((dico1["cover"]) != nil){
                                let cover = dico1["cover"] as! NSDictionary
                                let url = cover["medium"] as! String
                                self.cover.image = UIImage(data: NSData(contentsOfURL: NSURL(string:url)!)!)
                                libro.cover.image = self.cover.image
                            }
                            else{
                                self.cover.image = UIImage(named: "Image.png")
                            }
                            self.txtIsbn.resignFirstResponder()
                            toDoItems.append(libro)

                        }
                        else{
                            let alertController = UIAlertController(title: "Error", message:
                                "Not a valid ISBN", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                    }
                    catch{
                    }
                })
            }
        }
        
        let dt = session.dataTaskWithURL(url!, completionHandler: bloque)
        dt.resume()
    }
    
    


}

