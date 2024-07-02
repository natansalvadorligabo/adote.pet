package ifsp.arq.tsi.web1.adotepet.model;

public enum Gender {
    MASCULINO("Masculino"),
    FEMININO("Feminino"),
    OUTRO("Outro"),
    PREFIRO_NAO_DIZER("Prefiro não dizer");

    private String description;

    private Gender(String description){
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
