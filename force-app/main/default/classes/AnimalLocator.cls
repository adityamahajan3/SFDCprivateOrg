public class AnimalLocator {
    
    public static String getAnimalNameById(Integer id) {
        String apiUrl = 'https://th-apex-http-callout.herokuapp.com/animals/' + id;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(apiUrl);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            Map<String, Object> jsonResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            String animalName = (String) jsonResponse.get('name');
            return animalName;
        } else {
            // Handle error response
            return null;
        }
    }
}
