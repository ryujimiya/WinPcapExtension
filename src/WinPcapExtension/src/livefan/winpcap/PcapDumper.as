package livefan.winpcap
{
    import flash.external.ExtensionContext;
    import flash.utils.ByteArray;
	/**
     * 
     * @author Owner
     */
    public class PcapDumper 
    {
        private var _context:ExtensionContext;
        private var _nativeInstance:uint = 0;
        
        public function PcapDumper(context:ExtensionContext, nativeInstance:uint) 
        {
            this._context = context;
            this._nativeInstance = nativeInstance;
        }
        
        public function dispose():void
        {
            pcapDumpClose();
        }
        
        public function pcapDumpClose():void
        {
            if (this._nativeInstance == 0)
            {
                return;
            }
            NativeFunctions.pcapDumpClose(_context, this);
            this._nativeInstance = 0;
        }
        
        public function pcapDump(header:PcapPktHdr, data:ByteArray):void
        {
            NativeFunctions.pcapDump(_context, this, header, data);
        }
        
        public function pcapDumpFlush():int 
        {
            return NativeFunctions.pcapDumpFlush(_context, this);
        }

        public function pcapDumpFTell():int 
        {
            return NativeFunctions.pcapDumpFTell(_context, this);
        }

        public function get nativeInstance():uint
        {
            return _nativeInstance;
        }
        
    }

}