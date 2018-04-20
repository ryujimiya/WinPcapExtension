package livefan.winpcap
{
    import flash.external.ExtensionContext;
    import flash.utils.ByteArray;
    
    /**
     * 
     * @author Owner
     */
    public class ResultPcapNext 
    {
        protected var _retVal:int;
        protected var _header:PcapPktHdr;
        protected var _data:ByteArray;
        
        public function ResultPcapNext(context:ExtensionContext, retVal:int, headerNative:uint, data:ByteArray) 
        {
            this._retVal = retVal;
            if (headerNative != 0)
            {
                this._header = new PcapPktHdr(context, headerNative);
            }
            else
            {
                this._header = null;
            }
            this._data = data;
        }
        
        public function get retVal():int 
        {
            return _retVal;
        }
        
        public function get header():PcapPktHdr 
        {
            return _header;
        }
        
        public function get data():ByteArray 
        {
            return _data;
        }
        
    }

}