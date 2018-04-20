package livefan.winpcap
{
    import flash.external.ExtensionContext;
    import mx.core.UITextField;
	/**
     * 
     * @author Owner
     */
    public class ResultAllDevs 
    {
        private var _retVal:int = 0;
        private var _errBuf:String = "";
        private var _pcapIfs:PcapIf;
                
        public function ResultAllDevs(context:ExtensionContext, retVal:int, alldevsp:uint, errBuf:String) 
        {
            this._retVal = retVal;
            if (alldevsp != 0)
            {
                this._pcapIfs = new PcapIf(context, alldevsp);
            }
            else
            {
                this._pcapIfs = null;
            }
            this._errBuf = errBuf;
        }
        
        public function dispose():void
        {
            if (this._pcapIfs != null)
            {
                this._pcapIfs.dispose();
                this._pcapIfs = null;
            }
        }
        
        public function get retVal():int
        {
            return _retVal;
        }
        
        public function get errBuf():String 
        {
            return _errBuf;
        }
        
        public function get pcapIfs():PcapIf 
        {
            return _pcapIfs;
        }
    }

}