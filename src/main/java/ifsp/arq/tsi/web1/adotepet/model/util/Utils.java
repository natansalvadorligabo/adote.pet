package ifsp.arq.tsi.web1.adotepet.model.util;

import java.nio.file.Path;

public enum Utils {
    RESOURCES_PATH(Path.of(Utils.class.getProtectionDomain().getCodeSource().getLocation().getPath()).getParent().getParent().getParent().getParent().getParent() + "/resources");

    final String string;

    Utils(String string) {
        this.string = string;
    }

    public String getString() {
        return string;
    }
}
