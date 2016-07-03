import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let path: String = NSBundle.mainBundle().pathForResource("DemoWorkbook", ofType: "xlsx")!
    let spreadsheet: BRAOfficeDocumentPackage = BRAOfficeDocumentPackage.open(path)
    let worksheet: BRAWorksheet = spreadsheet.workbook.worksheets[0] as! BRAWorksheet
    let string: String = worksheet.cellForCellReference("A1").stringValue()
    print(string) // The Xcode console should now show the word "Alpha"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

