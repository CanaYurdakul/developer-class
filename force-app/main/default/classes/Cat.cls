public class Cat {
    public string name;
    public string color;

    public Cat() {  
        system.debug(' Cat contsructor called. Okay?');    
    }
    public Cat(string n, string clr){
        name= n;
        color= clr;
        sleeping();
    }
    public cat(string n){
        name = n;
        
    }
    public void sleeping(){
        system.debug(name + ' is sleeping');
    }
}