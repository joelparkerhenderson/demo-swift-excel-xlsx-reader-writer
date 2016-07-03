# Demo Swift Xslx Reader Writer

[XslxReaderWriter](https://github.com/renebigot/XlsxReaderWriter) is an Objective-C library that works with Excel OpenXml files (XLSX).

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

  * Project -> Demo -> Build Settings -> Linking -> Other Linker Flags -> Release -> (+) -> Any Architeture | Any SDK
  * Add: `-all_load`

Search Paths:

  * Project -> Demo -> Build Settings -> Search Paths -> User Header Search Paths -> Release -> (+) -> Any Architecture
  * Set it to: `$(SRCROOT)/XlsxReaderWriter/` not `$(SRCROOT)/XlsxReaderWriter/XlsxReaderWriter/`.
  * Select "recursive".

Bridging Header:

  * Add a new file to Xcode (File > New > File), then select “Source” and click “Header File“.
  * Name the file by convention: `Demo-Swift-Xlsx-Reader-Writer-Bridging-Header.h`
  * Add this text: `#import "XlsxReaderWriter-swift-bridge.h"`

Add the bridge:

  * Project -> Demo -> Build Settings -> Swift Compiler - Code Generation -> Objective-C Bridging Header -> Release -> (+) -> Any Architecture | Any SDK
  * Add: `Demo-Swift-Xlsx-Reader-Writer-Bridging-Header.h`

Verify:

  * Run the demo project. It should compile and launch a blank simulator.

