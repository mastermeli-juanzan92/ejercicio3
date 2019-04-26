package ejercicio3

import grails.converters.JSON
import groovy.json.JsonSlurper
import org.grails.web.json.JSONObject

class ClientController {

    def index() {



    }




    def validateForm(){




    }



    def categories(){
        myCategories.clear()
        def url = new URL("https://api.mercadolibre.com/sites/" + params.categoria + "/categories")
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        Collection<JSONObject> parser = (Collection<JSONObject>) json.parse(connection.getInputStream())

        render parser as JSON

    }
}
