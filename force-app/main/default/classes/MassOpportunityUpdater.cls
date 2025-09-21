public with sharing class MassOpportunityUpdater implements Database.Batchable<SObject>, Database.AllowsCallouts, Database.Stateful {
 private Integer updatedCount = 0;

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([
            SELECT Id,Name,Amount FROM Opportunity WHERE Amount != NULL
    ]);
    }

    public void execute(Database.BatchableContext bc, List<Opportunity> lstOpportunities){
        List <Opportunity> lstOppToUpdate = new List<Opportunity>();
        if(!lstOpportunities.isEmpty()){
            try{
            ExchangeRateResponseWrapper resp = ExchangeRateCallout.getExchangeRate('NGN');
            for(Opportunity opp : lstOpportunities){
                opp.EUR__c = opp.Amount* resp.rates.get('EUR');
                opp.GBP__c = opp.Amount * resp.rates.get('GBP');
                opp.USD__c = opp.Amount * resp.rates.get('USD');

                lstOppToUpdate.add(opp);
            }
           
        }catch(Exception ex){
            System.debug('Exception duirng batch job execution: ' + ex.getMessage());
        }

        }
         update lstOppToUpdate;
        updatedCount+=(lstOppToUpdate.isEmpty()?0:lstOppToUpdate.size());
        
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Done updating currency rates');
         System.debug('Total Opportunities updated: ' + updatedCount);
    }

}