package ifsp.arq.tsi.web1.adotepet.model.util;

import java.net.URISyntaxException;
import java.nio.file.Paths;

public enum Utils {

    RESOURCES_PATH(new Object() {
        String evaluate() {
            try {
                return Paths.get(Utils.class.getProtectionDomain().getCodeSource().getLocation().toURI())
                        .getParent().getParent().getParent().getParent().getParent()
                        .resolve("resources").toString();
            } catch (URISyntaxException e) {
                System.out.println(e.getMessage());
            }

            return "";
        }
    }.evaluate());

    private final String resourcesPath;

    Utils(String resourcesPath) { this.resourcesPath = resourcesPath; }

    public String value() { return resourcesPath; }
}