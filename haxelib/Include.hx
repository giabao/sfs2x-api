package ;
#if macro
import haxe.macro.Context;
import haxe.macro.Compiler;

class Include {
    static var config: Map<String, Array<String>> = [
        "haxe.ds.IntMap" => ["new", "exists", "get", "set", "remove", "iterator"],
        "haxe.ds.StringMap" => ["new", "exists", "get", "set", "remove"],
        "Lambda" => ["count", "has", "array"],
        "haxe.crypto.Md5" => ["encode"],
        "haxe.crypto.Base64" => ["encode"]
    ];

    public static function keep() {
        for (type in config.keys()) {
            for (field in config.get(type)){
                Compiler.addGlobalMetadata('$type.$field', "@:keep", false, false, true);
            }
            Context.getType(type);
        }
    }
}
#end
