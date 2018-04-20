package livefan.winpcap
{
    import flash.external.ExtensionContext;
    import flash.net.InterfaceAddress;
	/**
     * 
     * @author Owner
     */
    public class PcapAddr 
    {
        private var _next:PcapAddr;
        private var _addr:SockAddr;
        private var _netMask:SockAddr;
        private var _broadAddr:SockAddr;
        private var _dstAddr:SockAddr;
        
        public function PcapAddr(context:ExtensionContext, nativeInstance:uint) 
        {
            var nextNativeInstance:uint = context.call("pcapAddrGetNext", nativeInstance) as uint;
            if (nextNativeInstance != 0)
            {
                this._next = new PcapAddr(context, nextNativeInstance);
            }
            else
            {
                this._next = null;
            }
            var addrNativeInstance:uint = context.call("pcapAddrGetAddr", nativeInstance) as uint;
            if (addrNativeInstance != 0)
            {
                this._addr = new SockAddr(context, addrNativeInstance);
            }
            else
            {
                this._addr = null;
            }
            var netMaskNativeInstance:uint = context.call("pcapAddrGetNetMask", nativeInstance) as uint;
            if (netMaskNativeInstance != 0)
            {
                this._netMask = new SockAddr(context, netMaskNativeInstance);
            }
            else
            {
                this._netMask = null;
            }
            var broadAddrNativeInstance:uint = context.call("pcapAddrGetBroadAddr", nativeInstance) as uint;
            if (broadAddrNativeInstance != 0)
            {
                this._broadAddr = new SockAddr(context, broadAddrNativeInstance);
            }
            else
            {
                this._broadAddr = null;
            }
            var dstAddrNativeInstance:uint = context.call("pcapAddrGetDstAddr", nativeInstance) as uint;
            if (dstAddrNativeInstance != 0)
            {
                this._dstAddr = new SockAddr(context, dstAddrNativeInstance);
            }
            else
            {
                this._dstAddr = null;
            }
        }
        
        public function get next():PcapAddr 
        {
            return _next;
        }
        
        public function get addr():SockAddr 
        {
            return _addr;
        }
        
        public function get netMask():SockAddr 
        {
            return _netMask;
        }
        
        public function get broadAddr():SockAddr 
        {
            return _broadAddr;
        }
        
        public function get dstAddr():SockAddr
        {
            return _dstAddr;
        }
        
    }

}