# sfs2x-api
re-publish SFS2X_API_AS3.swc removing all external dependencies for using in openfl.
Also contain generated headers .hx files

## Features
why not just use `-swf-lib SFS2X_API_AS3.swc` with the swc provide from [smartfoxserver](http://www.smartfoxserver.com/download/sfs2x#p=client)? 

1. This lib add the header .hx files
see http://old.haxe.org/manual/swc

2. remove dependencies:
	+ ds_release_fp9.swc ([polygonal-ds](https://github.com/polygonal/ds))
	+ as3reflect.swc
	+ as3crypto.swc (only use class Base64)
	+ the **incompatible** as class built from haxe types that transitively depend from polygonal-ds.

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

if use the SFS2X_API_AS3.swc downloaded from smartfox then error (But use this sfs2x-api lib => OK):

```
ArgumentError: Error #1063: Argument count mismatch on MethodInfo-9(). Expected 1, got 3.
	at Array$/_map()
	at Function/<anonymous>()
	at Main()[O:\tmp\test-hx-gc\src\Main.hx:8]
```

This error is because the `map` function is from [as3 Array](http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/Array.html#map%28%29)
with `callback` function take 3 argument:

```as3
function map(callback:Function, thisObject:* = null):Array
function callback(item:*, index:int, array:Array):String;
```

But the haxe version of `map`:

```haxe
function map<S>( f : T -> S ) : Array<S>;
```

Similar for many other types / fields

## Using
```
haxelib install sfs2x-api
```

add `-lib sfs2x-api` to your .hxml build file
or: add `<haxelib name="sfs2x-api" />` to your openfl .xml application file

You do NOT need add `-swf-lib SFS2X_API_AS3.swc`

## Dev guild: Gen header files
run `gen.bat`

## Changelogs
version number indicate the compatible version of the .swc from [smartfoxserver](http://www.smartfoxserver.com/download/sfs2x#p=client)

### 1.6.0-rc.2
+ patch type of com.smartfoxserver.v2.entities.Room.playerList from Array<Dynamic> to Array<User>
+ add License notes to end of README.md file

### 1.6.0-rc.1
+ Built with haxe 3.2 & air-sdk 17
+ The SFS2X.swc is built from smartfox's source code version (maybe) 1.6.0 with some modify (remove dependencies).
+ This version just bump version number with no-change from v1.2.52.

## License
[SmartFoxServer](http://www.smartfoxserver.com/) is Copyright © gotoAndPlay() 2004-2012. All rights reserved | P.IVA 03121770048.

This software include (partially) source code of class com.hurlant.util.Base64 - 1.1.0 Copyright (c) 2006 Steve Webster.

File [SFS2X.swc](haxelib/SFS2X.swc) is built from source code provided and licensed by gotoAndPlay().

This software should NOT be used right now because I re-distribute the SFS2X.swf file without being permitted by gotoAndPlay().
