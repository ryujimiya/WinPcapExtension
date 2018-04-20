package livefan.winpcap
{
    import flash.external.ExtensionContext;
    
    /**
     * 
     * @author Owner
     */
    public class PcapStat
    {
        private var _psRecv:uint = 0;
        private var _psDrop:uint = 0;
        private var _psIfDrop:uint = 0;
        private var _psCapt:uint = 0;
        private var _psSent:uint = 0;
        private var _psNetdrop:uint = 0;
        
        public function PcapStat(context:ExtensionContext, nativeInstance:uint)
        {
            this._psRecv = context.call("pcapStatsGetPsRecv", nativeInstance) as uint;
            this._psDrop = context.call("pcapStatsGetPsDrop", nativeInstance) as uint;
            this._psIfDrop = context.call("pcapStatsGetPsIfdrop", nativeInstance) as uint;
            this._psCapt = context.call("pcapStatsGetPsCapt", nativeInstance) as uint;
            this._psSent = context.call("pcapStatsGetPsSent", nativeInstance) as uint;
            this._psNetdrop = context.call("pcapStatsGetPsNetdrop", nativeInstance) as uint;
        }
        
        public function get psRecv():uint 
        {
            return _psRecv;
        }
        
        public function get psDrop():uint 
        {
            return _psDrop;
        }
        
        public function get psIfDrop():uint 
        {
            return _psIfDrop;
        }
        
        public function get psCapt():uint 
        {
            return _psCapt;
        }
        
        public function get psSent():uint 
        {
            return _psSent;
        }
        
        public function get psNetdrop():uint 
        {
            return _psNetdrop;
        }
    
    }

}