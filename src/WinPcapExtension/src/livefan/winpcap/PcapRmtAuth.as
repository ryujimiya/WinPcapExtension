package livefan.winpcap
{
	/**
     * 
     * @author Owner
     */
    public class PcapRmtAuth 
    {
        private var _type:int = 0;
        private var _userName:String = "";
        private var _password:String = "";
        
        public function PcapRmtAuth() 
        {
            
        }
        
        public function get type():int 
        {
            return _type;
        }
        
        public function set type(value:int):void 
        {
            _type = value;
        }
        
        public function get userName():String 
        {
            return _userName;
        }
        
        public function set userName(value:String):void 
        {
            _userName = value;
        }
        
        public function get password():String 
        {
            return _password;
        }
        
        public function set password(value:String):void 
        {
            _password = value;
        }
        
    }

}