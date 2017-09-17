import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let path: String = Bundle.main.path(forResource: "demo", ofType: "xlsx")!
    let spreadsheet: BRAOfficeDocumentPackage = BRAOfficeDocumentPackage.open(path)
    let sheet: BRASheet = spreadsheet.workbook.sheets[0] as! BRASheet
    let worksheet: BRAWorksheet = spreadsheet.workbook.worksheets[0] as! BRAWorksheet
    let cell: BRACell = worksheet.cell(forCellReference: "A1")
    print(sheet.name) // print "Sheet1"
    print(cell.stringValue()) // print "Alpha"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

