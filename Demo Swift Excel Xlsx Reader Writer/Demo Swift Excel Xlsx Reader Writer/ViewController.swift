//
//  ViewController.swift
//  Demo Swift Excel Xlsx Reader Writer
//
//  Created by Joel on 9/25/17.
//  Copyright © 2017 JoelParkerHenderson.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the path to the path of wherever you put your Excel file.
        // The path in this demo code is the path to the demo.xlsx file.
        let path: String = Bundle.main.path(forResource: "demo", ofType: "xlsx")!
        
        // Open the spreadsheet, get the first sheet, first worksheet, and first cell A1.
        // This is solely demo code to show basics; your actual code would do much more here.
        let spreadsheet: BRAOfficeDocumentPackage = BRAOfficeDocumentPackage.open(path)
        let sheet: BRASheet = spreadsheet.workbook.sheets[0] as! BRASheet
        let worksheet: BRAWorksheet = spreadsheet.workbook.worksheets[0] as! BRAWorksheet
        let cell: BRACell = worksheet.cell(forCellReference: "A1")
        
        // Print some info to show the code works.
        print(sheet.name) // print "Sheet1"
        print(cell.stringValue()) // print "Alpha"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

