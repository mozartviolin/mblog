package mypackage;
 
import java.net.Socket;
import java.net.UnknownHostException;
import java.io.IOException;
 
public class DemoClient {
    /**
     * @Socket (Shortcut = Shift + F2) :
     * 
     *         <pre>
     *         public Socket(String host, int port) throws UnknownHostException,
     *         IOException
     */
    public static void main(String[] args) {
        try { 
            @SuppressWarnings({ "unused", "resource" })
            Socket sk = new Socket("127.0.0.1", 5050);
            System.out.println("난 클라이언트, 서버와 접속이 되었습니다....");
        } catch (UnknownHostException e) {        
            e.printStackTrace();
            System.out.println("접속 실패, UnknownHostException");
        } catch (IOException e) {        
            e.printStackTrace();
            System.out.println("접속 실패, IOException");
        }
    }
}