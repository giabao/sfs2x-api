rd /Q /S hxclasses
copy haxelib\SFS2X.swc .
haxe -debug -swf nothing.swf --no-output -swf-lib SFS2X.swc -swf-version 11.3 --gen-hx-classes  --macro patchTypes('sfs.patch')
rd /Q /S haxelib\com
del SFS2X.swc
move /Y hxclasses\com haxelib
del sfs2x-api.zip
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory('haxelib', 'sfs2x-api.zip'); }"
