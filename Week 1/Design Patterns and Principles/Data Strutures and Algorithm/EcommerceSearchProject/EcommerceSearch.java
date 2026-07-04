import java.util.Arrays;

public class EcommerceSearch {

    public static Product linearSearch(Product[] products, String target) {
        for (Product p : products) {
            if (p.productName.equalsIgnoreCase(target)) {
                return p;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, String target) {
        int left = 0;
        int right = products.length - 1;

        while (left <= right) {
            int mid = (left + right) / 2;

            int compare =
                    products[mid].productName.compareToIgnoreCase(target);

            if (compare == 0)
                return products[mid];
            else if (compare < 0)
                left = mid + 1;
            else
                right = mid - 1;
        }
        return null;
    }

    public static void main(String[] args) {

        Product[] products = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Shoes", "Fashion"),
                new Product(103, "Watch", "Accessories"),
                new Product(104, "Phone", "Electronics"),
                new Product(105, "Camera", "Electronics")
        };

        Product result1 = linearSearch(products, "Phone");

        System.out.println("Linear Search:");
        if (result1 != null)
            result1.display();

        Arrays.sort(products,
                (a, b) -> a.productName.compareToIgnoreCase(b.productName));

        Product result2 = binarySearch(products, "Phone");

        System.out.println("Binary Search:");
        if (result2 != null)
            result2.display();
    }
}