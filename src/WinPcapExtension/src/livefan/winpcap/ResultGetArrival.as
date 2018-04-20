package livefan.winpcap
{
    import flash.external.ExtensionContext;
    import flash.utils.ByteArray;
    
    /**
     * 
     * @author Owner
     */
    public class ResultGetArrival
    {
        private var _context:ExtensionContext = null;
        private var _arrivalPacketNative:uint = 0;
        private var _header:PcapPktHdr = null;
        private var _data:ByteArray = null;
        private var _retVal:int = 0;
        
        public function ResultGetArrival(context:ExtensionContext, arrivalPacketNative:uint)
        {
            this._context = context;
            this._arrivalPacketNative = arrivalPacketNative;
            if (arrivalPacketNative != 0)
            {
                // 到達パケットの情報を取得
                var headerNative:uint = context.call("arrivalPacketGetPktHdr", arrivalPacketNative) as uint;
                if (headerNative != 0)
                {
                    this._header = new PcapPktHdr(context, headerNative);
                }
                else
                {
                    this._header = null;
                }
                this._data = context.call("arrivalPacketGetPktData", arrivalPacketNative) as ByteArray;
                // スレッドハンドラの処理結果値を取得 (1:パケット取得成功 -1:エラー)
                this._retVal = context.call("arrivalPacketGetHandlerRet", arrivalPacketNative) as int;
            }
            else
            {
                this._header = null;
                this._data = null;
                this._retVal = -1; // パケット取得失敗
            }
        }
        
        public function dispose():void
        {
            if (_arrivalPacketNative != 0)
            {
                // 取得した到達パケットのnativeインスタンスを解放する
                var retFree:int = _context.call("arrivalPacketFree", this._arrivalPacketNative) as int;
                this._arrivalPacketNative = 0;
            }
            this._header = null;
            this._data = null;
        }
        
        public function get arrivalPacketNative():uint 
        {
            return _arrivalPacketNative;
        }
        
        public function get header():PcapPktHdr 
        {
            return _header;
        }
        
        public function get data():ByteArray 
        {
            return _data;
        }
        
        public function get retVal():int 
        {
            return _retVal;
        }
    }

}