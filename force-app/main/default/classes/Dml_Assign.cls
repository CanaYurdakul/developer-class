public class Dml_Assign {
    public static void insert_Dml() {
        account ac = new account();
        ac.Name = 'Cana Assignment';
        insert ac;
        account ac1 = new account();
        ac1.Name = 'Yurdakul Assignment';
        insert ac1;
    }
    public static void updating_dml() {
        account acc = new account();
        acc.Name = 'Account Created';
        insert acc;
        acc.Name = 'Account Updated';
        update acc;
    }
}