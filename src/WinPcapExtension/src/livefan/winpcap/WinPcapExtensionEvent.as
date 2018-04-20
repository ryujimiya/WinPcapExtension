package livefan.winpcap
{
    import flash.events.Event;
    
    /**
     * 
     * @author Owner
     */
    public class WinPcapExtensionEvent extends Event
    {
        public static const CAPTURETHREAD_PACKETARRIVAL:String = "CAPTURETHREAD_PACKETARRIVAL";
        public static const CAPTURETHREAD_THREADFUNCFINISHED:String = "CAPTURETHREAD_THREADFUNCFINISHED";
        
        public function WinPcapExtensionEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
        }
    
    }

}