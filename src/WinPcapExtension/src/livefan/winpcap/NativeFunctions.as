package livefan.winpcap
{
    import flash.external.ExtensionContext;
    import flash.utils.ByteArray;
    
    /**
     *
     * @author Owner
     */
    internal class NativeFunctions
    {
        public static function pcapLibVersion(context:ExtensionContext):String
        {
            return context.call("pcapLibVersion") as String;
        }
        
        public static function pcapMajorVersion(context:ExtensionContext, pcapHandle:PcapHandle):int
        {
            return context.call("pcapMajorVersion", context, pcapHandle.nativeInstance) as int;
        }

        public static function pcapMinorVersion(context:ExtensionContext, pcapHandle:PcapHandle):int
        {
            return context.call("pcapMinorVersion", context, pcapHandle.nativeInstance) as int;
        }
        
        public static function pcapGetErr(context:ExtensionContext, pcapHandle:PcapHandle):String
        {
            return context.call("pcapGetErr", context, pcapHandle.nativeInstance) as String;
        }

        public static function pcapStrError(context:ExtensionContext, error:int):String
        {
            return context.call("pcapStrError", context, error) as String;
        }

        public static function pcapFindAllDevs(context:ExtensionContext):ResultAllDevs
        {
            return context.call("pcapFindAllDevs", context) as ResultAllDevs;
        }
        
        public static function pcapFindAllDevsEx(context:ExtensionContext, source:String, auth:PcapRmtAuth):ResultAllDevs
        {
            return context.call("pcapFindAllDevsEx", context, source, auth) as ResultAllDevs;
        }
        
        public static function pcapFreeAllDevs(context:ExtensionContext, pcapIf:PcapIf):void
        {
            var alldevsp:uint = pcapIf.nativeInstance;
            var retValObj:Object = context.call("pcapFreeAllDevs", context, alldevsp);
        }
        
        public static function pcapCreateSrcStr(context:ExtensionContext, type:int, host:String, port:String, name:String):ResultPcapSrcStr
        {
            return context.call("pcapCreateSrcStr", context, type, host, port, name) as ResultPcapSrcStr;
        }
        
        public static function pcapParseSrcStr(context:ExtensionContext, source:String):ResultPcapSrcStr
        {
            return context.call("pcapParseSrcStr", context, source) as ResultPcapSrcStr;
        }
        
        public static function pcapOpen(context:ExtensionContext, source:String, snapLen:int, flags:int, readTimeout:int, auth:PcapRmtAuth):ResultPcap
        {
            return context.call("pcapOpen", context, source, snapLen, flags, readTimeout, auth) as ResultPcap;
        }
        
        public static function pcapClose(context:ExtensionContext, pcapHandle:PcapHandle):void
        {
            var pcapHandleNative:uint = pcapHandle.nativeInstance;
            var retValObj:Object = context.call("pcapClose", context, pcapHandleNative);
        }
        
        public static function pcapNextEx(context:ExtensionContext, pcapHandle:PcapHandle):ResultPcapNext
        {
            return context.call("pcapNextEx", context, pcapHandle.nativeInstance) as ResultPcapNext;
        }
        
        public static function pcapDumpOpen(context:ExtensionContext, pcapHandle:PcapHandle, fname:String):ResultPcapDump
        {
            return context.call("pcapDumpOpen", context, pcapHandle.nativeInstance, fname) as ResultPcapDump;
        }
        
        public static function pcapDumpClose(context:ExtensionContext, pcapDumper:PcapDumper):void
        {
            var retObj:Object = context.call("pcapDumpClose", context, pcapDumper.nativeInstance);
        }
        
        public static function pcapDump(context:ExtensionContext, pcapDumper:PcapDumper, header:PcapPktHdr, data:ByteArray):void
        {
            var retObj:Object = context.call("pcapDump", context, pcapDumper.nativeInstance, header.nativeInstance, data);
        }
        
        public static function pcapDumpFlush(context:ExtensionContext, pcapDumper:PcapDumper):int
        {
            return context.call("pcapDumpFlush", context, pcapDumper.nativeInstance) as int;
        }
        
        public static function pcapDumpFTell(context:ExtensionContext, pcapDumper:PcapDumper):int
        {
            return context.call("pcapDumpFTell", context, pcapDumper.nativeInstance) as int;
        }
        
        public static function pcapDataLink(context:ExtensionContext, pcapHandle:PcapHandle):int
        {
            return context.call("pcapDataLink", context, pcapHandle.nativeInstance) as int;
        }
        
        public static function pcapListDataLinks(context:ExtensionContext, pcapHandle:PcapHandle):Array
        {
            return context.call("pcapListDataLinks", context, pcapHandle.nativeInstance) as Array;
        }
        
        public static function pcapSetDataLink(context:ExtensionContext, pcapHandle:PcapHandle, dlt:int):int
        {
            return context.call("pcapSetDataLink", context, pcapHandle.nativeInstance, dlt) as int;
        }
        
        public static function pcapDataLinkNameToVal(context:ExtensionContext, dltName:String):int
        {
            return context.call("pcapDataLinkNameToVal", context, dltName) as int;
        }
        
        public static function pcapDataLinkValToDescription(context:ExtensionContext, dlt:int):String
        {
            return context.call("pcapDataLinkValToDescription", context, dlt) as String;
        }
        
        public static function pcapDataLinkValToName(context:ExtensionContext, dlt:int):String
        {
            return context.call("pcapDataLinkValToName", context, dlt) as String;
        }
        
        public static function pcapSetMode(context:ExtensionContext, pcapHandle:PcapHandle, mode:int):int 
        {
            return context.call("pcapSetMode", context, pcapHandle.nativeInstance, mode) as int;
        }
        
        public static function pcapSetFilter(context:ExtensionContext, pcapHandle:PcapHandle, filterStr:String, optimize:int, netmask:uint):int
        {
            var retObj:Object = context.call("pcapSetFilter", context, pcapHandle.nativeInstance, filterStr, optimize, netmask);
            if (retObj == null)
            {
                return -1;
            }
            return retObj as int;
        }
        
        public static function pcapStats(context:ExtensionContext, pcapHandle:PcapHandle):ResultPcapStats 
        {
            return context.call("pcapStats", context, pcapHandle.nativeInstance) as ResultPcapStats;
        }
        
        public static function pcapSendPacket(context:ExtensionContext, pcapHandle:PcapHandle, buf:ByteArray):int 
        {
            return context.call("pcapSendPacket", context, pcapHandle.nativeInstance, buf) as int;
        }
        
        public static function pcapSendQueueAlloc(context:ExtensionContext, memSize:uint):PcapSendQueue
        {
            var _pcapSendQueueNative:uint = context.call("pcapSendQueueAlloc", context, memSize) as uint;
            var pcapSendQueue:PcapSendQueue = new PcapSendQueue(context, _pcapSendQueueNative);
            return pcapSendQueue;
        }
        
        public static function pcapSendQueueDestroy(context:ExtensionContext, pcapSendQueue:PcapSendQueue):int
        {
            var retObj:Object = context.call("pcapSendQueueDestroy", context, pcapSendQueue.nativeInstance);
            if (retObj == null)
            {
                return -1;
            }
            return retObj as int;
        }
        
        public static function pcapSendQueueQueue(context:ExtensionContext, pcapSendQueue:PcapSendQueue, header:PcapPktHdr, pktData:ByteArray):int
        {
            return context.call("pcapSendQueueQueue", context, pcapSendQueue.nativeInstance, header.nativeInstance, pktData) as int;
        }
        
        public static function pcapSendQueueTransmit(context:ExtensionContext, pcapHandle:PcapHandle, pcapSendQueue:PcapSendQueue, sync:int):uint 
        {
            return context.call("pcapSendQueueTransmit", context, pcapHandle.nativeInstance, pcapSendQueue.nativeInstance, sync) as uint;
        }
        
    }

}