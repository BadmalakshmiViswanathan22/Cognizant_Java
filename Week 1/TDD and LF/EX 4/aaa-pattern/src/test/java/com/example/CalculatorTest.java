package com.example;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class CalculatorTest {

    private Calculator calculator;

    @Before
    public void setUp() {
        System.out.println("Setting up Calculator object...");
        calculator = new Calculator();
    }

    @After
    public void tearDown() {
        System.out.println("Cleaning up resources...");
        calculator = null;
    }

    @Test
    public void testAddition() {
        int a = 10;
        int b = 5;

        
        int result = calculator.add(a, b);

        
        assertEquals(15, result);
    }

    @Test
    public void testSubtraction() {

        
        int a = 10;
        int b = 5;

        
        int result = calculator.subtract(a, b);


        assertEquals(5, result);
    }

    @Test
    public void testMultiplication() {

        
        int a = 4;
        int b = 5;

        
        int result = calculator.multiply(a, b);

        
        assertEquals(20, result);
    }

    @Test
    public void testDivision() {

        
        int a = 20;
        int b = 5;

        
        int result = calculator.divide(a, b);

        
        assertEquals(4, result);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testDivideByZero() {

        
        int a = 10;
        int b = 0;

        
        calculator.divide(a, b);

    
    }
}