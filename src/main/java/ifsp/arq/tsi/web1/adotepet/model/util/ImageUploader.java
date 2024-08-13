package ifsp.arq.tsi.web1.adotepet.model.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

public class ImageUploader {
    private static final String UPLOAD_DIR = "images";

    public static String upload(HttpServletRequest req, Part filePart) throws IOException {
        UUID randomImageId = UUID.randomUUID();

        String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String fileNameWithoutExtension = removeImageExtension(originalFileName);
        String extension = getImageExtension(originalFileName);

        String fileNameWithUUID = fileNameWithoutExtension + "-" + randomImageId + "." + extension;

        String applicationPath = req.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Path filePath = Paths.get(uploadFilePath, fileNameWithUUID);

        Files.copy(filePart.getInputStream(), filePath);

        return UPLOAD_DIR + "/" + fileNameWithUUID;
    }

    private static String removeImageExtension(String fileName) {
        return fileName.substring(0, fileName.lastIndexOf("."));
    }

    private static String getImageExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }
}