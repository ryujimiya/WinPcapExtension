package livefan.winpcap
{
    import flash.external.ExtensionContext;

    /**
     * 
     * @author Owner
     */
    public class Timeval 
    {
        private var _context:ExtensionContext;
        private var _nativeInstance:uint;
        
        public function Timeval(context:ExtensionContext, nativeInstance:uint) 
        {
            this._context = context;
            this._nativeInstance = nativeInstance;
        }
        
        public function get tvSec():uint 
        {
            return _context.call("timevalGetTvSec", this._nativeInstance) as uint;
        }
        
        public function set tvSec(value:uint):void
        {
            var retObj:Object = _context.call("timevalSetTvSec", this._nativeInstance, value);
        }
        
        public function get tvUsec():uint 
        {
            return _context.call("timevalGetTvUsec", this._nativeInstance) as uint;
        }
        
        public function set tvUsec(value:uint):void 
        {
            var retObj:Object = _context.call("timevalSetTvUsec", this._nativeInstance, value);
        }
    }

}