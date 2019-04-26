package ejercicio3

import grails.converters.JSON
import groovy.json.JsonSlurper
import org.grails.web.json.JSONObject

class ClientController {

    ArrayList inputParams = new ArrayList();


    def index() {


    }


    def getAgencies() {
        inputParams.clear()

        String site_id = params.site_id
        String payment_method_id = params.payment_method
        String[] near_to = [params.longitud, params.latitud, params.radio]
        Criterio criterio = Criterio.DISTANCE

        if (params.criterio == "address_line") {
            criterio = Criterio.ADDRESS_LINE
        } else if (params.criterio == "agency_code") {
            criterio = Criterio.AGENCY_CODE
        }
        String limit = params.limit
        String off_set = params.off_set


       render ClientService.callAPIAgenci(site_id, payment_method_id, near_to, (criterio.getCriterio().toLowerCase()), limit, off_set) as JSON


    }


}
