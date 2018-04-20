package livefan.winpcap
{
    import flash.external.ExtensionContext;
    /**
     * 
     * @author Owner
     */
    public class ResultPcap 
    {
        protected var _retVal:int;
        protected var _pcapHandle:PcapHandle;
        protected var _errBuf:String;
        
        public function ResultPcap(context:ExtensionContext, retVal:int, pcapHandleNative:uint, errBuf:String) 
        {
            this._retVal = retVal;
            this._pcapHandle = new PcapHandle(context, pcapHandleNative);
            this._errBuf = errBuf;
        }
        
        public function dispose():void
        {
            if (this._pcapHandle != null)
            {
                this._pcapHandle.dispose();
                this._pcapHandle = null;
            }
        }
        
        public function get retVal():int
        {
            return _retVal;
        }
        
        public function get pcapHandle():PcapHandle 
        {
            return _pcapHandle;
        }
        
        public function get errBuf():String 
        {
            return _errBuf;
        }
        
    }

}