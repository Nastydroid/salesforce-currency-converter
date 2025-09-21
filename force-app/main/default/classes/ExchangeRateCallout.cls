public with sharing class ExchangeRateCallout {

    public static ExchangeRateResponseWrapper getExchangeRate(String baseCurrency){
        ExchangeRate__mdt getApi = ExchangeRate__mdt.getInstance('RateApi');
        Http http = new Http();
        HttpRequest req = new HttpRequest();

        req.setEndpoint(getApi.EndPoint__c + baseCurrency);
        req.setMethod('GET');
        
        HttpResponse response = http.send(req);
        if(response.getStatusCode() == 200){
            ExchangeRateResponseWrapper result = (ExchangeRateResponseWrapper)JSON.deserialize(response.getBody(),ExchangeRateResponseWrapper.class);
            System.debug(result);
            return result;
        }else {
            throw new CalloutException('error ' +response.getStatusCode());
        }

    }

}