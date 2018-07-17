package quanpham.nashtech.musicstore.serviceimpl;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
public class MultipartFileServiceImpl {
	public void checkMultipartFileEmpty(CommonsMultipartFile file, HttpServletRequest request) {
		String nameFile = file.getOriginalFilename();
		System.out.println(nameFile);
		if (!"".equals(nameFile)) {
			String dirFile = request.getServletContext().getRealPath("images");
			System.out.println(dirFile);
			File fileDir = new File(dirFile);
			if (!fileDir.exists()) {
				fileDir.mkdir();
			}
			try {
				file.transferTo(new File(fileDir + File.separator + nameFile));
				System.out.println("Upload file thành công!");
				// modelMap.addAttribute("filename", nameFile);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				System.out.println("Upload file thất bại!");
			}
		}
	}
	/*
	 * public Album upload(Album album, MultipartFile imageFile) { // Upload
	 * file to storage try { byte[] bytes = imageFile.getBytes(); String
	 * fileName = imageFile.getOriginalFilename(); String dirFile =
	 * request.getServletContext().getRealPath("images"); String fileLocation =
	 * new File("src\\main\\resources\\static\\images").getAbsolutePath() + "\\"
	 * + fileName; FileOutputStream fos = new FileOutputStream(fileLocation);
	 * fos.write(bytes); fos.close(); } catch (IOException e) {
	 * e.printStackTrace(); }
	 * 
	 * // Update image name in DB
	 * album.setAlbumArtUrl(imageFile.getOriginalFilename()); return
	 * albumRepository.save(album); }
	 */
}
