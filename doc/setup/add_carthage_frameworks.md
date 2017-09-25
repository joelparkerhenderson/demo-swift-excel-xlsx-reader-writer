# Add Carthage frameworks

To see if you have Carthage installed, and if the Carthage version is current, run this command:

    $ carthage version
    0.25.0

If Carthage is not installed, or the version is lower than 0.25.0:

  * Use these [Carthage instructions](https://github.com/Carthage/Carthage)


## Create a Carthage Cartfile
 
Create an empty text file named `Cartfile` at the top level of the project. 
   
Edit the `Cartfile`.

  * You can add any framework you want. 

  * For example, you can add this text:

      github "user/example"

Update.

    $ carthage update
    *** Fetching Prelude
    *** Downloading Example.framework binary at "2.0"
    *** xcodebuild output can be found in /var/folders/…


## Troubleshooting

To update for just one platform, without using binaries, and with verbose messages:

```shell
carthage update --platform ios --no-use-binaries --verbose  
```

If you get an error such as "Build Failed. Task failed with exit code..." then try to run:


```shell
rm -rf Carthage/Builds/*
rm -rf Carthage/Checkouts/*
rm -rf ~/Library/Caches/org.carthage.CarthageKit
carthage update --no-use-binaries
```

If you are building just for one plaftorm, such as iOS, then try to ru:

```shell
carthage update --platform iOS
```

Some frameworks have subtle bugs with version specification, and you can try changing the Cartfile line from the syntax "~> X.Y.Z" to the syntax "vX.Y.Z", or to a commit hash.

  * `github "danielgindi/Charts" ~> 3.0.1` fails due to build error on some systems.

  * `github "danielgindi/Charts" "v3.0.1"` succeeds.

If you want to try wiping out everything the Xocde knows about the project, then you can delete derived data, typically like this:

```shell
rm -rf ~/Library/Developer/Xcode/DerivedData
```

If you want to build for just one platform, and build binaries and archive them, then run:

```shell
carthage build --platform iOS --no-skip-current && carthage archive Example
```


If you see an error message like this "A shell task (foobar) failed with exit code", then try running the shell command yourself:

```
foobar
```

If you see an error message about git clone failing like this: "A shell task (/usr/bin/env git clone --bare --quiet https://user/Example.git ~/Library/Caches/org.carthage.CarthageKit/dependencies/Example) failed with exit code 128: error: RPC failed; curl 56 LibreSSL SSL_read: SSL_ERROR_SYSCALL, errno 60" then try running the shell command and also using verbose flags:

```shell
GIT_SSH_COMMAND="ssh -vvv" \
/usr/bin/env git clone --verbose --bare --quiet \
https://github.com/user/Example.git \
~/Library/Caches/org.carthage.CarthageKit/dependencies/Example
```


## See results

You can see the results so far, if you want to verify that Carthage is working.

  * There is a new file `Cartfile.resolved`.

    ```shell
    $ ls -1 Cartfile*
    Cartfile
    Cartfile.resolved
    ```

  * The new file `Cartfile.resolved` lists each framework and its exact version number.

    ```shell
    $ cat Cartfile.resolved
    github "user/Example" "2.0.0"
    ```

  * There is a new directory `Carthage`.

    ```shell
    $ ls -1 Carthage
    Build
    Checkouts
    ```


## Link the framework

Go to the Xcode project "General" area.

Scroll down the section "Linked Frameworks and Libraries", with the text that says "Add frameworks &amp; libraries here".

Tap the "+" icon.

  * A dialog opens that says "Choose frameworks and libraries to add".

  * Tap the button "Add Other..."

Choose the framework.

  * A file chooser opens.

  * Navigate up a folder, and you see the "Carthage" folder.

  * Open the folder "Carthage", then the folder "Build", then the folder "iOS".

  * Tap the file "Example.framework" (or whatever the name is) to highlight it.

  * Tap "Open"

The section "Linked Frameworks and Libraries" now shows "Example.framework".


## Create the Run Script

Go to the Xcode project "Build Phases" settings area.

  * Click the "+" icon, then choose "New Run Script Phase".

  * Click the triangle by the new "Run Script" list item.

  * The "Shell" field should say `/bin/sh`.

  * The larger text field should say `Type a script or drag a script file from your workspace to insert its path`.

  * Set the larger text field to say `/usr/local/bin/carthage copy-frameworks`

Add input files.

  * In the area "Add input files here", click "+".

  * Set the "Input Files" to `$(SRCROOT)/Carthage/Build/iOS/Example.framework`


## More

Need help with Carthage? See our repo [demo_swift_carthage](https://github.com/joelparkerhenderson/demo_swift_carthage).

