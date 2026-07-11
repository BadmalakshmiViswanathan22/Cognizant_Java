package main.java.com.cognizant.loan.controller;

import main.java.com.cognizant.loan.model.Loan;

@RestController
public class LoanController {

    @GetMapping("/loans/{number}")
    public Loan getLoan(@PathVariable String number) {

        return new Loan(
                number,
                "car",
                400000,
                3258,
                18);
    }
}