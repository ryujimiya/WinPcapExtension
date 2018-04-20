package livefan.winpcap
{
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    import flash.events.StatusEvent;
    import flash.utils.ByteArray;
    import flash.external.ExtensionContext;
    
    /**
     *
     * @author Owner
     */
    public class WinPcapExtension extends EventDispatcher
    {
        private var _context:ExtensionContext;
        
        public function WinPcapExtension(target:flash.events.IEventDispatcher = null)
        {
            super(target);
        
            //ネイティブ拡張コンテキストを生成
            _context = ExtensionContext.createExtensionContext("livefan.winpcap", null);
            _context.addEventListener(StatusEvent.STATUS, onContextStatus);
        }
        
        public function dispose():void
        {
            _context.removeEventListener(StatusEvent.STATUS, onContextStatus);
            _context.dispose();
        }
        
        private function onContextStatus(e:StatusEvent):void 
        {
            var extensionEvent:WinPcapExtensionEvent = null;
            var code:String = e.code;
            var level:String = e.level;

            //trace("WinPcapExtension::onContextStatus code = " + e.code + "  level = " + e.level);
            //// そのままStatusEventをdispatch
            //dispatchEvent(e);
            if (code == WinPcapExtensionEvent.CAPTURETHREAD_PACKETARRIVAL)
            {
                extensionEvent = new WinPcapExtensionEvent(WinPcapExtensionEvent.CAPTURETHREAD_PACKETARRIVAL);
            }
            else if (code == WinPcapExtensionEvent.CAPTURETHREAD_THREADFUNCFINISHED)
            {
                extensionEvent = new WinPcapExtensionEvent(WinPcapExtensionEvent.CAPTURETHREAD_THREADFUNCFINISHED);
            }
            else
            {
                // 未実装ステータス
            }
            if (extensionEvent != null)
            {
                dispatchEvent(extensionEvent);
            }
        }
        
        // misc exported functions
        public function Htonl(hostlong:uint):uint
        {
            return SockAddr.Htonl(_context, hostlong);
        }
        
        public function Htons(hostshort:uint):uint
        {
            return SockAddr.Htons(_context, hostshort);
        }
        
        public function Ntohl(netlong:uint):uint
        {
            return SockAddr.Ntohl(_context, netlong);
        }
        
        public function Ntohs(netshort:uint):uint 
        {
            return SockAddr.Ntohs(_context, netshort);
        }
        
        public function IpAddrByteArrayToString(family:int, ipAddrAsBytes:ByteArray):String
        {
            return SockAddr.IpAddrByteArrayToString(_context, family, ipAddrAsBytes);
        }
        
        public function IpAddrStringToByteArray(family:int, ipAddrAsString:String):ByteArray 
        {
            return SockAddr.IpAddrStringToByteArray(_context, family, ipAddrAsString);
        }
        
        // winPcap exported functions
        public function pcapLibVersion():String
        {
            return NativeFunctions.pcapLibVersion(_context);
        }

        public function pcapFindAllDevs():ResultAllDevs
        {
            return NativeFunctions.pcapFindAllDevs(_context);
        }
        
        public function pcapFindAllDevsEx(source:String, auth:PcapRmtAuth):ResultAllDevs
        {
            return NativeFunctions.pcapFindAllDevsEx(_context, source, auth);
        }
        
        public function pcapStrError(error:int):String
        {
            return NativeFunctions.pcapStrError(_context, error);
        }

        public function pcapCreateSrcStr(
            type:int,
            host:String,
            port:String,
            name:String):ResultPcapSrcStr
        {
            return NativeFunctions.pcapCreateSrcStr(_context, type, host, port, name);
        }
        
        public function pcapParseSrcStr(source:String):ResultPcapSrcStr
        {
            return NativeFunctions.pcapParseSrcStr(_context, source);
        }
        
        public function pcapOpen(source:String, snapLen:int, flags:int, readTimeout:int, auth:PcapRmtAuth):ResultPcap
        {
            return NativeFunctions.pcapOpen(_context, source, snapLen, flags, readTimeout, auth);
        }
        
        public function pcapDataLinkValToDescription(dlt:int):String
        {
            return NativeFunctions.pcapDataLinkValToDescription(_context, dlt);
        }
        
        public function pcapDataLinkValToName(dlt:int):String
        {
            return NativeFunctions.pcapDataLinkValToName(_context, dlt);
        }
        
        public function pcapSendQueueAlloc(memSize:uint):PcapSendQueue
        {
            return NativeFunctions.pcapSendQueueAlloc(_context, memSize);
        }
        
        public function newPcapPktHdr():PcapPktHdr
        {
            // headerのnativeInstanceに0を指定して新規のnativeインスタンスを作成する
            var header:PcapPktHdr = new PcapPktHdr(_context, 0);
            return header;
        }

    }

}