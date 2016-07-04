import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let path: String = NSBundle.mainBundle().pathForResource("demo", ofType: "xlsx")!
    let spreadsheet: BRAOfficeDocumentPackage = BRAOfficeDocumentPackage.open(path)
    let sheet: BRASheet = spreadsheet.workbook.sheets[0] as! BRASheet
    let worksheet: BRAWorksheet = spreadsheet.workbook.worksheets[0] as! BRAWorksheet
    let string: String = worksheet.cellForCellReference("A1").stringValue()
    print(sheet.name) // print "Sheet1"
    print(string) // print "Alpha"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

