package livefan.winpcap
{
    import flash.external.ExtensionContext;
    
    /**
     * 
     * @author Owner
     */
    public class PcapPktHdr 
    {
        private var _context:ExtensionContext;
        private var _nativeInstance:uint;
        private var _allocated:Boolean = false;
        private var _ts:Timeval = null;
        
        public function PcapPktHdr(context:ExtensionContext, nativeInstance:uint) 
        {
            this._context = context;
            if (nativeInstance == 0)
            {
                // nativeインスタンスを新規確保する
                this._allocated = true;
                _newNative();
            }
            else
            {
                // 指定されたnativeインスタンスを使用する
                this._allocated = false;
                this._nativeInstance = nativeInstance;
            }
            var tsNative:uint = _context.call("pcapPktHdrGetTs", this._nativeInstance) as uint;
            this._ts = new Timeval(_context, tsNative);
        }
        
        public function dispose():void
        {
            if (this._allocated)
            {
                _freeNative();
            }
        }
        
        private function _newNative():void
        {
            this._nativeInstance = _context.call("newPcapPktHdr") as uint;
        }
        
        private function _freeNative():void
        {
            if (this._nativeInstance == 0)
            {
                return;
            }
            _context.call("freePcapPktHdr", this._nativeInstance);
            this._nativeInstance = 0;
            this._ts = null;
        }

        public function get nativeInstance():uint 
        {
            return _nativeInstance;
        }

        public function get ts():Timeval 
        {
            return _ts;
        }
        
        public function get capLen():uint 
        {
            return _context.call("pcapPktHdrGetCapLen", this._nativeInstance) as uint;
        }
        
        public function set capLen(value:uint):void 
        {
            var retObj:Object = _context.call("pcapPktHdrSetCapLen", this._nativeInstance, value);
        }

        public function get len():uint 
        {
            return _context.call("pcapPktHdrGetLen", this._nativeInstance) as uint;
        }

        public function set len(value:uint):void 
        {
            var retObj:Object = _context.call("pcapPktHdrSetLen", this._nativeInstance, value);
        }
    }

}