global with sharing class dictionaryCalloutHandler {
     
    @AuraEnabled(cacheable=true)   
    global static String getDefinition(string input)
    {
        HttpRequest  req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        String s;
        req.setEndpoint('https://api.dictionaryapi.dev/api/v2/entries/en/'+input);
        req.setMethod('GET');
        res = http.send(req);
        
        if(res.getStatusCode() == 200 && res.getbody() != null)
        {
           List<JSON2Apex> j2a = (List<JSON2Apex>) JSON.deserialize(res.getBody(), List<JSON2Apex>.class);          
               s = j2a[0].meanings[0].definitions[0].definition;
        }
        else
        {
            s = 'error';
        }
        return s;
    }


    @AuraEnabled(cacheable=true)   
    global static String getAudio(string input)
    {
        HttpRequest  req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        String s;
        req.setEndpoint('https://api.dictionaryapi.dev/api/v2/entries/en/'+input);
        req.setMethod('GET');
        res = http.send(req);
        
        if(res.getStatusCode() == 200 && res.getbody() != null)
        {
           List<JSON2Apex> j2a = (List<JSON2Apex>) JSON.deserialize(res.getBody(), List<JSON2Apex>.class);          
                s = j2a[0].phonetics[0].audio;
        }
        else
        {
            s = 'error';
        }
        return s;
    }
    
}