public class FinancialForecast {

    // Recursive method
    public static double futureValue(double amount, double rate, int years) {

        // Base case
        if (years == 0) {
            return amount;
        }

        // Recursive case
        return futureValue(amount * (1 + rate), rate, years - 1);
    }

    public static void main(String[] args) {

        double initialAmount = 1000;
        double growthRate = 0.10; // 10%
        int years = 5;

        double result = futureValue(initialAmount, growthRate, years);

        System.out.println("Initial Amount: " + initialAmount);
        System.out.println("Growth Rate: " + (growthRate * 100) + "%");
        System.out.println("Years: " + years);
        System.out.println("Predicted Future Value: " + result);
    }
}