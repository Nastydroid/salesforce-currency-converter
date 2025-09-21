public with sharing class ExchangeRateCalculator {
//public abstract String getCurrencyName();

public static void onAfterInsert(List<Opportunity> newOpp, Map<Id,Opportunity> mapOpportunity){
    multiCurrencyBuilder(mapOpportunity.keySet());
}

@future(Callout=true)
public static void multiCurrencyBuilder(Set<Id> opp){
    List<Opportunity> lstOpportunity = [SELECT Id,Amount,Name FROM Opportunity WHERE Id IN :opp];
    ExchangeRateResponseWrapper resp = ExchangeRateCallout.getExchangeRate('NGN');
    for(Opportunity updateOpp : lstOpportunity){
        updateOpp.USD__c = updateOpp.Amount * resp.rates.get('USD');
        updateOpp.GBP__c = updateOpp.Amount * resp.rates.get('GBP');
        updateOpp.EUR__c = updateOpp.Amount * resp.rates.get('EUR');    
    }
    //System.debug(resp.rates.get('NGN'));
    update lstOpportunity;
}
    
}