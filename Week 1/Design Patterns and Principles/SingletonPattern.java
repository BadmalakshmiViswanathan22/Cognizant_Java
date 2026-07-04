

class Logger {

    
    private static Logger instance = new Logger();


    private Logger() {
    }

    public static Logger getInstance() {
        return instance;
    }
}
public class SingletonPattern {
    public static void main(String[] args) {

        Logger l1 = Logger.getInstance();
        Logger l2 = Logger.getInstance();

        
        if (l1 == l2) {
            System.out.println("Only one instance of Logger is created.");
        } else {
            System.out.println("Multiple instances are created.");
        }
    }
}