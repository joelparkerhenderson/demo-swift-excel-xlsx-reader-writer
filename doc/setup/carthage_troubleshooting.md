# Carthage troubleshooting

If Carthage is not working the way you expect, try these troubleshooting ideas.


## Use verbose

To use verbose messages:

```shell
carthage update --verbose  
```


## Use platform

To update for just one platform:

```shell
carthage update --platform ios
```


## Use builds, not binaries

To build everything i.e. to not use pre-built binaries:

```shell
carthage update --no-use-binaries
```


## Force builds

To force carthage to build everything fresh, and not skip over anything that it thinks is already current:

```shell
carthage update --no-skip-current
```


## All together

All the above ideas together:

```shell
carthage update --verbose  --platform ios --no-use-binaries --no-skip-current
```


## Clear caches

To clear caches:

```shell
rm -rf Carthage/Builds/*
rm -rf Carthage/Checkouts/*
rm -rf ~/Library/Caches/org.carthage.CarthageKit
```


## Delete derived data

To erase everything the Xocde knows about the project:

```shell
rm -rf ~/Library/Developer/Xcode/DerivedData
```

If you have moved your derived data folder, you can find it by using Xcode project settings and/or Xcode workspace settings.


## Build failed

If you get an error such as "Build Failed. Task failed with exit code..." then try to do all of the above:

```shell
rm -rf Carthage/Builds/*
rm -rf Carthage/Checkouts/*
rm -rf ~/Library/Caches/org.carthage.CarthageKit
rm -rf ~/Library/Developer/Xcode/DerivedData
carthage update --verbose  --platform ios --no-use-binaries --no-skip-current
```


## Version specification bug

At least one framework has a reported issue with a subtle bug with a version specification:

  * `github "danielgindi/Charts" ~> 3.0.1` fails due to build error on some systems.

  * `github "danielgindi/Charts" "v3.0.1"` succeeds.

Try changing the Cartfile line from the syntax "~> X.Y.Z" to the syntax "vX.Y.Z", or to a commit hash.


## A shell task failed

If you see an error message like this:

  * "A shell task (foobar) failed with exit code"

Then try running the shell command yourself:

```shell
foobar
```


## Git clone failed

If you see an error message about git clone failing like this: 

  * "A shell task (/usr/bin/env git clone --bare --quiet https://user/Example.git ~/Library/Caches/org.carthage.CarthageKit/dependencies/Example) failed with exit code 128: error: RPC failed; curl 56 LibreSSL SSL_read: SSL_ERROR_SYSCALL, errno 60" 

Then try running the shell command with git verbose flags, and removing the flag `--quiet`:

```shell
GIT_SSH_COMMAND="ssh -vvv" \
/usr/bin/env git clone --verbose --bare \
https://github.com/user/Example.git \
~/Library/Caches/org.carthage.CarthageKit/dependencies/Example
```

Then you should see output like this:

```shell
Cloning into bare repository '~/Library/Caches/org.carthage.CarthageKit/dependencies/Example'...
POST git-upload-pack (gzip 1565 to 800 bytes)
remote: Counting objects: 13890, done.
remote: Compressing objects: 100% (12/12), done.
```

This is a good way to see if an update is having problems due to reaching the remote repository, or due to slow transfer speeds, or due to password issues.

If you see this error:

```shell
error: RPC failed; curl 18 transfer closed with outstanding read data remaining
fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed
```

Then the problem is likely due to general Internet congestion or similar networking failures. Contact your systems administrator, or Internet service provider, or try using a different WiFi network, or use the command `traceroute` or similar to diagnose any networking issue.
