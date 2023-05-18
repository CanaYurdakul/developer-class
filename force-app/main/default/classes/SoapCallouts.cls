public with sharing class SoapCallouts {

    public static String[] getParksByCountry(String country){
        ParksServices.ParksImplPort parkService = new ParksServices.ParksImplPort();
        String [] parks = parkService.byCountry(country);
        system.debug(parks);
        return parks;
    }

    public static Double doAddCallout(double a, Double b){
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double sum = calcService.doAdd(a,b);
        system.debug(a + ' add ' + b + ' = ' + sum);
        return sum;
    }
    public static Double doMultiplyCallout(Double a, Double b){
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double mult = calcService.doMultiply(a, b);
        system.debug(a + ' multiply ' + b + ' = ' + mult);
        return mult;
    }
}