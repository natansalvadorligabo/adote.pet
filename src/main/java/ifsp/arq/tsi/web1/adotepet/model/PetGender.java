package ifsp.arq.tsi.web1.adotepet.model;

public enum PetGender {
    MALE("Macho"),
    FEMALE("Fêmea");

    private String description;

    PetGender(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
