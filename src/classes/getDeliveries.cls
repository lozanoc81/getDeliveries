public class getDeliveries {
    public static List<String> makeGetCallout(String Region) {
        List<String> resultList = new List<String>();
        if(Region == '' || Region == null)
            Region = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://desolate-scrubland-88410.herokuapp.com/deliveries/' + Region);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Parse entire JSON response.
            JSONParser parser = JSON.createParser(response.getBody());
            while (parser.nextToken() != null) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                    (parser.getText() == 'Delivery')) {
                        // Get the value.
                        parser.nextToken();
                        // Compute the grand total price for all invoices.
                        System.debug(parser.getText());
                        resultList.add(parser.getText());
                        
                    }
            }
        }      
        return resultList;
    }
    
    public class Delivery {
        public ID Id;
        public String DeliveryDate;
    }
}