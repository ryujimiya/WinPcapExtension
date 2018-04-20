package livefan.winpcap
{
    import flash.external.ExtensionContext;
    import flash.utils.ByteArray;
    
    /**
     * 
     * @author Owner
     */
    public class ResultPcapDump
    {
        private var _pcapDumper:PcapDumper = null;
        
        public function ResultPcapDump(context:ExtensionContext, pcapDumperNative:uint)
        {
            if (pcapDumperNative != 0)
            {
                this._pcapDumper = new PcapDumper(context, pcapDumperNative);
            }
            else
            {
                this._pcapDumper = null;
            }
        }
        
        public function dispose():void
        {
            if (this._pcapDumper != null)
            {
                this._pcapDumper.dispose();
                this._pcapDumper = null;
            }
            
        }
        
        public function get pcapDumper():PcapDumper 
        {
            return _pcapDumper;
        }
    
    }

}