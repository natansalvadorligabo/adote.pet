package ifsp.arq.tsi.web1.adotepet.model;

public enum Size {
    SMALL("Pequeno"),
    MEDIUM("Médio"),
    LARGE("Grande");

    private final String size;

    Size(String size) { this.size = size; }

    public String getSize() { return size; }
}
