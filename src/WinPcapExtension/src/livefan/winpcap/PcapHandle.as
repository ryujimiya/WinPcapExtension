package livefan.winpcap
{
    import flash.external.ExtensionContext;
    import flash.utils.ByteArray;
    
    /**
     *
     * @author Owner
     */
    public class PcapHandle
    {
        private var _context:ExtensionContext;
        private var _nativeInstance:uint;
        private var _captureThreadParamNative:uint;
        
        public function PcapHandle(context:ExtensionContext, nativeInstance:uint)
        {
            this._context = context;
            this._nativeInstance = nativeInstance;
            this._captureThreadParamNative = 0;
        }
        
        public function dispose():void
        {
            pcapClose();
        }
        
        public function startCaptureThread():void
        {
            this._captureThreadParamNative = _context.call("startCaptureThread", _context, this._nativeInstance) as uint;
        }
        
        public function stopCaptureThread():void
        {
            if (this._captureThreadParamNative == 0)
            {
                return;
            }
            var ret:int = _context.call("stopCaptureThread", _context, this._captureThreadParamNative) as int;
            if (ret == -2)
            {
                // 正常(pcap_breakloopでスレッド処理を抜けた)
            }
            this._captureThreadParamNative = 0;
        }
        
        public function getArrivalPacketCount():int
        {
            if (this._captureThreadParamNative == 0)
            {
                return 0;
            }
            return _context.call("arrivalPacketListLength", this._captureThreadParamNative) as int;
        }
        
        public function getArrivalPacket():ResultGetArrival
        {
            var resGetArrival:ResultGetArrival = null;
            var arrivalPacketNative:uint = 0;

            if (this._captureThreadParamNative == 0)
            {
                return null;
            }
            // 到達パケットを取得
            arrivalPacketNative = _context.call("arrivalPacketListShift", this._captureThreadParamNative) as uint;
            resGetArrival = new ResultGetArrival(_context, arrivalPacketNative);
            return resGetArrival;
        }

        public function pcapClose():void
        {
            if (this._nativeInstance == 0)
            {
                return;
            }
            NativeFunctions.pcapClose(_context, this);
            this._nativeInstance = 0;
        }

        public function pcapNextEx():ResultPcapNext
        {
            return NativeFunctions.pcapNextEx(_context, this);
        }
        
        public function pcapDumpOpen(fname:String):ResultPcapDump
        {
            return NativeFunctions.pcapDumpOpen(_context, this, fname);
        }
        
        public function pcapMajorVersion():int
        {
            return NativeFunctions.pcapMajorVersion(_context, this);
        }
        
        public function pcapMinorVersion():int
        {
            return NativeFunctions.pcapMinorVersion(_context, this);
        }
        
        public function pcapGetErr():String
        {
            return NativeFunctions.pcapGetErr(_context, this);
        }
        
        public function pcapDataLink():int
        {
            return NativeFunctions.pcapDataLink(_context, this);
        }
        
        public function pcapListDataLinks():Array 
        {
            return NativeFunctions.pcapListDataLinks(_context, this);
        }
        
        public function pcapSetDataLink(dlt:int):int
        {
            return NativeFunctions.pcapSetDataLink(_context, this, dlt);
        }
        
        public function pcapSetMode(mode:int):int
        {
            return NativeFunctions.pcapSetMode(_context, this, mode);
        }
        
        public function pcapSetFilter(filterStr:String, optimize:int, netmask:uint):int
        {
            var netmaskNetLong:uint = SockAddr.Htonl(_context, netmask);
            return NativeFunctions.pcapSetFilter(_context, this, filterStr, optimize, netmaskNetLong); 
        }
        
        public function pcapStats():ResultPcapStats 
        {
            return NativeFunctions.pcapStats(_context, this);
        }
        
        public function pcapSendPacket(buf:ByteArray):int 
        {
            return NativeFunctions.pcapSendPacket(_context, this, buf);
        }
        
        public function pcapSendQueueTransmit(pcapSendQueue:PcapSendQueue, sync:int):uint
        {
            return NativeFunctions.pcapSendQueueTransmit(_context, this, pcapSendQueue, sync);
        }

        public function get nativeInstance():uint
        {
            return _nativeInstance;
        }
    
    }

}