public with sharing class MassOpportunityScheduler implements Schedulable {
    public void execute(SchedulableContext sc){
        MassOpportunityUpdater updateAllOpp = new MassOpportunityUpdater();
        Database.executeBatch(updateAllOpp, 200);
    }
}