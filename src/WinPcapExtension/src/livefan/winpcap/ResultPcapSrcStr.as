package livefan.winpcap
{
    import flash.external.ExtensionContext;
	/**
     * 
     * @author Owner
     */
    public class ResultPcapSrcStr 
    {
        private var _retVal:int;
        private var _source:String;
        private var _type:int;
        private var _host:String;
        private var _port:String;
        private var _name:String;
        private var _errBuf:String;
        
        public function ResultPcapSrcStr(
            context:ExtensionContext,
            retVal:int,
            source:String,
            type:int,
            host:String,
            port:String,
            name:String,
            errBuf:String) 
        {
            this._retVal = retVal;
            this._source = source;
            this._type = type;
            this._host = host;
            this._port = port;
            this._name = name;
            this._errBuf = errBuf;
        }
        
        public function get retVal():int 
        {
            return _retVal;
        }
        
        public function get source():String 
        {
            return _source;
        }
        
        public function get type():int 
        {
            return _type;
        }
        
        public function get host():String 
        {
            return _host;
        }
        
        public function get port():String 
        {
            return _port;
        }
        
        public function get name():String 
        {
            return _name;
        }

        public function get errBuf():String 
        {
            return _errBuf;
        }
        
    }

}