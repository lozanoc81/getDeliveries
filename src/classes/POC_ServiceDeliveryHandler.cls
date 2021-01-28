global class POC_ServiceDeliveryHandler {
    @InvocableMethod(label='Integración System Delivery' description='Método invocable para obtener fechas de entrega del sistema externo')
    public static List<String> tryIntegration(list<integrationVariables> newServi){

        List<String> resultList = new List<String>();
        
        try { 
            String reqRegion = newServi.get(0).Region;
            resultList = getDeliveries.makeGetCallout(reqRegion);
          	return resultList;      
        }
        catch(Exception ex)
        {
             throw ex;
        }
  
      }
    
    global class integrationVariables {
      @InvocableVariable(required=true)
      global String Region = '';
    }
}