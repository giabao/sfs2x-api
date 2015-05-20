# sfs2x-api
re-publish SFS2X_API_AS3.swc removing all external dependencies for using in openfl. Also contain generated headers .hx files

see http://old.haxe.org/manual/swc

## Using
```
haxelib install sfs2x-api
```

add `-lib sfs2x-api` to your .hxml build file
or: add `<haxelib name="sfs2x-api" />` to your openfl .xml application file

You don NOT need add `-swf-lib SFS2X_API_AS3.swc`

## Dev guild: Gen header files
1. build & install [haxe](https://github.com/HaxeFoundation/haxe/) with the changed `typeload.ml` file
2. run `gen.bat`

## Changelogs
