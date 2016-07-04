# Demo Swift Excel Xlsx Reader Writer

[XlsxReaderWriter](https://github.com/renebigot/XlsxReaderWriter) is an Objective-C library that works with Excel OpenXml files (XLSX).

## To create this demo

Create a new project.

Get the repository:

    git clone --depth=1 https://github.com/renebigot/XlsxReaderWriter.git

We put the repository in the same folder as our demo project's xcodeproject:

    Demo Swift Xsls Reader Writer/XlsxReaderWriter

Add XlsxReaderWriter.xcodeproj to your project.

Add dependency:

  * Targets -> Demo -> Build Phases -> Target Dependencies
  * Add XslxReaderWriter -> XslxReaderWriter

Link binaries:

  * Targets -> Demo -> Build Phases -> Link Binaries With Libraries.
  * Add `libXlsxReaderWriter.a`.
  * Add `libz.tbd`. This is more current than what the official doc says, which is to add the older version named `libz.dylib`.

Linking:

  * Project -> Demo -> Build Settings -> Linking -> Other Linker Flags
  * -> (Debug & Release) -> (+) -> Any Architeture | Any SDK
  * Add: `-all_load`

Search Paths:

  * Project -> Demo -> Build Settings -> Search Paths -> User Header Search Paths
  * -> (Debug & Release) -> (+) -> Any Architecture
  * Set it to: `$(SRCROOT)/XlsxReaderWriter/` not `$(SRCROOT)/XlsxReaderWriter/XlsxReaderWriter/`.
  * Select "recursive".

Bridging Header:

  * Add a new file to Xcode (File > New > File), then select “Source” and click “Header File“.
  * We like the file name `Bridge.h`
  * Add this text: `#import "XlsxReaderWriter-swift-bridge.h"`

Bridging Header complete file:

    #ifndef Demo_Swift_Xlsx_Reader_Writer_Bridging_Header_h
    #define Demo_Swift_Xlsx_Reader_Writer_Bridging_Header_h
    #import "XlsxReaderWriter-swift-bridge.h"
    #endif /* Demo_Swift_Xlsx_Reader_Writer_Bridging_Header_h */

Add the bridge:

  * Project -> Demo -> Build Settings -> Swift Compiler - Code Generation -> Objective-C Bridging Header
  * -> (Debug & Release) -> (+) -> Any Architecture | Any SDK -> Add: `Bridge.h`

Verify:

  * Run the project.
  * It should compile and launch a blank simulator.

## To load an Excel file

Create an Excel file by using your own Excel software, or any Excel-compatible software.

  * For example, create `DemoWorkbook.xlsx` and save it in the repository.
  * For example, in the cell A1, type the word "Alpha".

Edit `ViewController.swift`:

    import UIKit

    class ViewController: UIViewController {

      override func viewDidLoad() {
        super.viewDidLoad()
        let path: String = NSBundle.mainBundle().pathForResource("DemoWorkbook", ofType: "xlsx")!
        let spreadsheet: BRAOfficeDocumentPackage = BRAOfficeDocumentPackage.open(path)
        let sheet: BRASheet = spreadsheet.workbook.sheets[0] as! BRASheet
        let worksheet: BRAWorksheet = spreadsheet.workbook.worksheets[0] as! BRAWorksheet
        let cell: BRACell = worksheet.cellForCellReference("A1")
        print(sheet.name) // print "Sheet1"
        print(cell.stringValue()) // print "Alpha"
      }

      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      }

    }

Verify:

  * Run the project.
  * It should compile and launch a blank simulator.
  * The Xcode console should now show the text "Sheet1" and "Alpha".

## Tracking

* Package: demo_swift_excel_xlsx_reader_writer
* Version: 2.1.0
* Created: 2016-07-02
* Updated: 2016-07-04
* License: Any of GPL, LGPL, BSD, MIT
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
