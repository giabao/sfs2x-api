# sfs2x-api
re-publish SFS2X_API_AS3.swc removing all external dependencies for using in openfl. Also contain generated headers .hx files

## Features
why not just use `-swf-lib SFS2X_API_AS3.swc` with the swc provide from smartfox? 

1. This lib add the header .hx files
see http://old.haxe.org/manual/swc

2. remove dependencies:
	+ ds_release_fp9.swc
	+ as3reflect.swc
	+ as3crypto.swc (only use class Base64)

3. Integrate better with haxe.
Ex, with the following code:
```haxe
import haxe.Json;
import openfl.display.Sprite;

class Main extends Sprite {
	public function new() {
		super();
        var a: Array<Int> = Json.parse('[2,3,4]');
        a.map(function(i) return i+1);
	}
}
```

if use SFS2X_API_AS3.swc download from smartfox then error:
```
ArgumentError: Error #1063: Argument count mismatch on MethodInfo-9(). Expected 1, got 3.
	at Array$/_map()
	at Function/<anonymous>()
	at Main()[O:\tmp\test-hx-gc\src\Main.hx:8]
```

But use this sfs2x-api lib => OK!

## Using
```
haxelib install sfs2x-api
```

add `-lib sfs2x-api` to your .hxml build file
or: add `<haxelib name="sfs2x-api" />` to your openfl .xml application file

You don NOT need add `-swf-lib SFS2X_API_AS3.swc`

## Dev guild: Gen header files
run `gen.bat`

## Changelogs
version number indicate the compatible version of the .swc from [smartfoxserver](http://www.smartfoxserver.com/download/sfs2x#p=client)

### 1.6.0-rc.1
+ Built with haxe 3.2 & air-sdk 17
+ The SFS2X.swc is built from smartfox's source code version (maybe) 1.6.0 with some modify (remove dependencies).
+ This version just bump version number with no-change from v1.2.52.
