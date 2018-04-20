package livefan.winpcap
{
    import flash.external.ExtensionContext;
    
    /**
     *
     * @author Owner
     */
    public class PcapIf
    {
        private var _context:ExtensionContext;
        private var _nativeInstance:uint;
        private var _next:PcapIf;
        private var _name:String;
        private var _description:String;
        private var _addresses:PcapAddr;
        private var _flags:uint;
        
        public function PcapIf(context:ExtensionContext, nativeInstance:uint)
        {
            this._context = context;
            var nextNativeInstance:uint = context.call("pcapIfGetNext", nativeInstance) as uint;
            if (nextNativeInstance != 0)
            {
                this._next = new PcapIf(context, nextNativeInstance);
            }
            else
            {
                this._next = null;
            }
            this._nativeInstance = nativeInstance;
            this._name = context.call("pcapIfGetName", nativeInstance) as String;
            this._description = context.call("pcapIfGetDescription", nativeInstance) as String;
            var addressesInstance:uint = context.call("pcapIfGetAddresses", nativeInstance) as uint;
            if (addressesInstance != 0)
            {
                this._addresses = new PcapAddr(context, addressesInstance);
            }
            else
            {
                this._addresses = null;
            }
            this._flags = context.call("pcapIfGetFlags", nativeInstance) as uint;
        }
        
        public function dispose():void
        {
            pcapFreeAllDevs();
        }
        
        public function pcapFreeAllDevs():void
        {
            if (this._nativeInstance == 0)
            {
                return;
            }
            NativeFunctions.pcapFreeAllDevs(_context, this);
        }
        
        public function get next():PcapIf
        {
            return _next;
        }
        
        public function get nativeInstance():uint
        {
            return _nativeInstance;
        }
        
        public function get name():String
        {
            return _name;
        }
        
        public function get description():String
        {
            return _description;
        }
        
        public function get addresses():PcapAddr
        {
            return _addresses;
        }
        
        public function get flags():uint
        {
            return _flags;
        }
    
    }

}