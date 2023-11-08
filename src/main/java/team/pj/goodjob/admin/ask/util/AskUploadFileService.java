package team.pj.goodjob.admin.ask.util;
import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
public class AskUploadFileService {

	public String upload(MultipartFile file) {

		boolean result = false;
		
		// File ¿˙¿Â
		String fileOriName = file.getOriginalFilename();
		System.out.println(fileOriName);
		String fileExtension = 
				fileOriName.substring(fileOriName.lastIndexOf("."), fileOriName.length());
		String uploadDir = "C:\\library\\upload";
		
		UUID uuid = UUID.randomUUID();
		String uniqueName = uuid.toString().replaceAll("-", "");
		
		File saveFile = new File(uploadDir + "\\" + uniqueName + fileExtension);
		
		if (!saveFile.exists())
			saveFile.mkdirs();
		
		try {
			file.transferTo(saveFile);
			result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		if (result) {
			return uniqueName + fileExtension;
		} else {
			return null;
		}
		
	}
	
}
