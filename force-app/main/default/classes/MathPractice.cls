public class MathPractice {
    public decimal practiceOne (decimal a, decimal b) {
        decimal pm = 2 * (a + b) ;
        return pm;
    }
    public decimal practiceTwo (decimal x, decimal y){
        decimal bmi = x/ (y*y);
        return bmi;
    }
    public decimal practiceThree (decimal c, decimal d){
        decimal average = (c + d) / 2;
        return average;
    }
    public decimal practiceFour (decimal cost){
        decimal bonus = 0;
        if (cost <= 0) {
            bonus =0;
            system.debug('Hatalı bir değer girdiniz');
        }else if (cost > 0 && cost < 49) {
            bonus = 0;
            system.debug('Bonus kazanamadınız');
        }else if (cost > 50 && cost < 199) {
            bonus = 10;
            system.debug(cost + ' $ tutarındaki alışveriş karşılığı ' + bonus + ' $ tutarında bonus kazandınız'); 
        }else if (cost > 200 && cost < 499) {
            bonus = 30;
            system.debug(cost + ' $ tutarındaki alışveriş karşılığı ' + bonus + ' $ tutarında bonus kazandınız');  
        }else if (cost >500) {
            bonus = 50;
            system.debug(cost + ' $ tutarındaki alışveriş karşılığı ' + bonus + ' $ tutarında bonus kazandınız');
        }
        return bonus;
    }
}