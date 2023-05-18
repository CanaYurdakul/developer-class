public with sharing class AccountCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByIndustry(string industry){
        return [SELECT Id, Name, Type, Industry, AnnualRevenue FROM Account
        WHERE Industry = :industry WITH SECURITY_ENFORCED];
    }
}