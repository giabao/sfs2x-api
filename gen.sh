rm -Rf hxclasses
haxe -debug -swf nothing.swf --no-output -swf-lib SFS2X_API_AS3.swc -swf-version 11.3 --gen-hx-classes  --macro patchTypes\(\'sfs.patch\'\)
rm sfs2x-api.zip
rm -Rf com && mkdir -p com/smartfoxserver
mv hxclasses/com/smartfoxserver com/smartfoxserver
zip -r sfs2x-api.zip . -icom/smartfoxserver/* -ihaxelib.json
