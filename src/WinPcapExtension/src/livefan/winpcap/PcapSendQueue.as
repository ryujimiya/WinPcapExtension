package livefan.winpcap
{
    import flash.external.ExtensionContext;
    import flash.utils.ByteArray;
    
    /**
     * 
     * @author Owner
     */
    public class PcapSendQueue
    {
        private var _context:ExtensionContext = null;
        private var _nativeInstance:uint = 0;
        
        public function PcapSendQueue(context:ExtensionContext, nativeInstance:uint)
        {
            this._context = context;
            this._nativeInstance = nativeInstance;
        }
        
        public function dispose():void
        {
            pcapSendQueueDestroy();
        }
        
        public function pcapSendQueueDestroy():void
        {
            if (this._nativeInstance == 0)
            {
                return;
            }
            var ret:int = NativeFunctions.pcapSendQueueDestroy(_context, this);
            this._nativeInstance = 0;
        }
        
        public function pcapSendQueueQueue(header:PcapPktHdr, data:ByteArray):int
        {
            return NativeFunctions.pcapSendQueueQueue(_context, this, header, data);
        }
    
        public function get nativeInstance():uint 
        {
            return _nativeInstance;
        }
        
        public function get maxLen():uint
        {
            return _context.call("pcapSendQueueGetMaxLen", this._nativeInstance) as uint;
        }
        
        public function get len():uint
        {
            return _context.call("pcapSendQueueGetLen", this._nativeInstance) as uint;
        }
        
        public function get buffer():ByteArray
        {
            return _context.call("pcapSendQueueGetBuffer", this._nativeInstance) as ByteArray;
        }
        
    }

}