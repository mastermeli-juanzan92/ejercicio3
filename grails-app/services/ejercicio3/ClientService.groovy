package ejercicio3

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import groovy.json.JsonSlurper
import org.grails.web.json.JSONObject

@Transactional
class ClientService {


    ArrayList<Agency> myAgencies = new ArrayList<>()

    def serviceMethod() {

    }



    def static callAPIAgenci(String site_id, String payment_method_id , String[] near_to ,
                      String criterio , String limit , String off_set ) {


        //validarParamObligatorios(site_id , payment_method_id , near_to , criterio , limit , off_set)
//localhost:8090/agencias?site_id=MLA&payment_method=rapipago&near_to=-31.412971,-64.18758,300&criterio=distance&off_set=0&limit=0

        def url = new URL("http://localhost:8090/agencias?" +
                "site_id="+site_id +
                "&payment_method="+payment_method_id +
                "&near_to=" + near_to[1] +"," +near_to[0] +"," + near_to[2] +
                "&criterio=" + criterio +
                "&off_set=" + off_set +
                "&limit="+limit)
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def parser = json.parse(connection.getInputStream()).data

        return parser
    }

    private Boolean validarParamObligatorios(String site_id, String payment_method_id , String[] near_to ,
                                             String criterio , String limit , String off_set) throws Exception {
        return true

    }


}
