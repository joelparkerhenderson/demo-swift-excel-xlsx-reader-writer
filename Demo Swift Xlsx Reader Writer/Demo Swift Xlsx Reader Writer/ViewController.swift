//
//  ViewController.swift
//  Demo Swift Xlsx Reader Writer
//
//  Created by Joel Parker Henderson on 2016-07-03.
//  Copyright © 2016 Joel Parker Henderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    var documentPath: String = NSBundle.mainBundle().pathForResource("DemoWorkbook", ofType: "xlsx")!
    var spreadsheet: BRAOfficeDocumentPackage = BRAOfficeDocumentPackage.open(documentPath)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

