package livefan.winpcap
{
    import flash.external.ExtensionContext;
    import flash.utils.ByteArray;

    /**
     * 
     * @author Owner
     */
    public class SockAddr
    {
        public static const AF_INET:uint = 2;
        public static const AF_INET6:uint = 23;
        
        private var _saFamily:uint = 0;
        private var _addrAsBytes:ByteArray = null;
        //private var _addrAsString:String = "";
        //private var _addrAsUint:uint = 0;
        //private var _addrAsUintArray:Array = null;
        private var _port:uint = 0;
        private var _flowInfo:uint = 0;
        private var _scopeId:uint = 0;
        
        public function SockAddr(context:ExtensionContext, nativeInstance:uint) 
        {
            this._saFamily = context.call("sockAddrGetSaFamily", nativeInstance) as uint;
            
            if (saFamily == AF_INET)
            {
                // IPv4
                this._addrAsBytes = context.call("sockAddrInGetSinAddrAsByteArray", nativeInstance) as ByteArray;
                //this._addrAsString = context.call("sockAddrInGetSinAddrAsString", nativeInstance) as String;
                //this._addrAsUint = context.call("sockAddrInGetSinAddrAsUint32", nativeInstance) as uint;
                //this._addrAsUintArray = null;
                this._port = context.call("sockAddrInGetSinPort", nativeInstance) as uint;
                this._flowInfo = 0;
                this._scopeId = 0;
            }
            else if (saFamily == AF_INET6)
            {
                // IPv6
                this._addrAsBytes = context.call("sockAddrIn6GetSin6AddrAsByteArray", nativeInstance) as ByteArray;
                //this._addrAsString = context.call("sockAddrIn6GetSin6AddrAsString", nativeInstance) as String;
                //this._addrAsUint = 0;
                //this._addrAsUintArray = context.call("sockAddrIn6GetSin6AddrAsUint16Array", nativeInstance) as Array;
                this._port = context.call("sockAddrIn6GetSin6Port", nativeInstance) as uint;
                this._flowInfo = context.call("sockAddrIn6GetSin6FlowInfo", nativeInstance) as uint;
                this._scopeId = context.call("sockAddrIn6GetSin6ScopeId", nativeInstance) as uint;
            }
            else
            {
                this._addrAsBytes = context.call("sockAddrGetSaData", nativeInstance) as ByteArray;
                //this._addrAsString = "";
                //this._addrAsUint = 0;
                //this._addrAsUintArray = null;
                this._port = 0;
                this._flowInfo = 0;
                this._scopeId = 0;
            }
            
            // ネットワークバイトオーダーをホストバイトオーダーに変換
            //this._addrAsUint = Ntohl(context, this._addrAsUint);
            //if (this._addrAsUintArray != null)
            //{
            //    for (var i:int = 0; i < this._addrAsUintArray.length; i++)
            //    {
            //        // Note:uint配列だけれど、16bit値が格納されている
            //        this._addrAsUintArray[i] = Ntohs(context, this._addrAsUintArray[i]);
            //    }
            //}
            this._port = Ntohs(context, this._port);
            this._flowInfo = Ntohl(context, this._flowInfo);
            this._scopeId = Ntohl(context, this._scopeId);
        }
        
        public static function Ntohl(context:ExtensionContext, netlong:uint):uint
        {
            return context.call("Ntohl", netlong) as uint;
        }
        
        public static function Ntohs(context:ExtensionContext, netshort:uint):uint
        {
            return context.call("Ntohs", netshort) as uint;
        }

        public static function Htonl(context:ExtensionContext, hostlong:uint):uint
        {
            return context.call("Htonl", hostlong) as uint;
        }
        
        public static function Htons(context:ExtensionContext, hostshort:uint):uint
        {
            return context.call("Htons", hostshort) as uint;
        }
        
        public static function IpAddrByteArrayToString(context:ExtensionContext, family:int, ipAddrAsBytes:ByteArray):String
        {
            return context.call("IpAddrByteArrayToString", family, ipAddrAsBytes) as String;
        }
        
        public static function IpAddrStringToByteArray(context:ExtensionContext, family:int, ipAddrAsString:String):ByteArray
        {
            return context.call("IpAddrStringToByteArray", family, ipAddrAsString) as ByteArray;
        }

        public function get saFamily():uint 
        {
            return _saFamily;
        }
        
        public function get addrAsBytes():ByteArray 
        {
            return _addrAsBytes;
        }
        
        //public function get addrAsString():String 
        //{
        //    return _addrAsString;
        //}
        
        //public function get addrAsUint():uint 
        //{
        //    return _addrAsUint;
        //}
        
        //public function get addrAsUintArray():Array 
        //{
        //    return _addrAsUintArray;
        //}
    }

}