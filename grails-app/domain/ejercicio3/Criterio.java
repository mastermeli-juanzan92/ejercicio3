package ejercicio3;

public enum Criterio {

    ADDRESS_LINE ("address_line"),
    DISTANCE("distance"),
    AGENCY_CODE ("agency_code") ;

    private String criterio ;


    Criterio(String criterio){
        this.criterio=criterio ;
    }

    public String getCriterio() {
        return criterio;
    }

    public void setCriterio(String criterio) {
        this.criterio = criterio;
    }
}
