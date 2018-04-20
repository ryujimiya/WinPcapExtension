package livefan.winpcap
{
    import flash.external.ExtensionContext;
    
    /**
     * 
     * @author Owner
     */
    public class ResultPcapStats
    {
        private var _retVal:int = 0;
        private var _pcapStat:PcapStat = null;
        
        public function ResultPcapStats(context:ExtensionContext, retVal:int, pcapStatNative:uint)
        {
            this._retVal = retVal;
            if (retVal != -1)
            {
                this._pcapStat = new PcapStat(context, pcapStatNative);
            }
            else
            {
                this._pcapStat = null;
            }
        }
        
        public function get retVal():int 
        {
            return _retVal;
        }
        
        public function get pcapStat():PcapStat 
        {
            return _pcapStat;
        }
    
    }

}