package quanpham.nashtech.musicstore.controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import quanpham.nashtech.musicstore.entity.Album;
import quanpham.nashtech.musicstore.entity.RatingStar;
import quanpham.nashtech.musicstore.entity.RatingStarPK;
import quanpham.nashtech.musicstore.entity.User;
import quanpham.nashtech.musicstore.repository.AlbumRepository;
import quanpham.nashtech.musicstore.repository.RateRepository;
import quanpham.nashtech.musicstore.repository.UserRepository;

@Controller
public class RateController {
	private static final String COMMA_DELIMITER = ",";
	private static final String NEW_LINE_SEPARATOR = "\n";
	@Autowired
	private RateRepository rateRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private AlbumRepository albumRepository;
	@PersistenceContext
	private EntityManager entityManager;

	@GetMapping("/rate")
	public String rateStar(User user) {
		return "redirect:/";
	}
	
	public void recommender(List<RatingStar> list, String nameFile, User user) throws IOException, TasteException{
		list = rateRepository.findAll();
		//DataModel model = list;
		DataModel model = new FileDataModel(new File(nameFile));
		UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
		UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0, similarity, model);
		UserBasedRecommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
		List<RecommendedItem> recommendations = recommender.recommend(user.getId(), 3);
		for(RecommendedItem item : recommendations) {
			System.out.println(item);
		}
	}

	public void writeToCSV(String nameFile, List<RatingStar> list) {
		list = rateRepository.findAll();
		FileWriter fileWriter = null;
		try {
			fileWriter = new FileWriter(nameFile);
			for (RatingStar student : list) {
				fileWriter.append(String.valueOf(student.getRatingstarPK().getUserId()));
				fileWriter.append(COMMA_DELIMITER);
				fileWriter.append(String.valueOf(student.getAlbum().getId()));
				fileWriter.append(COMMA_DELIMITER);
				fileWriter.append(String.valueOf(student.getRatingStar()));
				fileWriter.append(NEW_LINE_SEPARATOR);
			}
			System.out.println("CSV file was created successfully !!!");
		} catch (Exception e) {
			System.out.println("Error in CsvFileWriter !!!");
			e.printStackTrace();
		} finally {

			try {
				fileWriter.flush();
				fileWriter.close();
			} catch (IOException e) {
				System.out.println("Error while flushing/closing fileWriter !!!");
				e.printStackTrace();
			}
		}

		// return entityManager.createNativeQuery("select * from
		// mvcmusicstore.ratingstar").getResultList();
		// createQuery("LOAD DATA LOCAL INFILE 'D:/test.csv' REPLACE INTO TABLE
		// mvcmusicstore.ratingstar FIELDS TERMINATED BY ',' LINES TERMINATED BY
		// '\n' IGNORE 1 LINES;").executeUpdate();
	}

	@PostMapping("/rate")
	public String rateStarModel(HttpServletRequest request) throws IOException, TasteException {
		int albumId = Integer.parseInt(request.getParameter("idAlbum"));
		int numberStar = Integer.parseInt(request.getParameter("star"));
		Principal principal = request.getUserPrincipal();
		List<RatingStar> list= rateRepository.findAll();
		if (principal == null) {
			return "redirect:/login";
		}
		User user = userRepository.findByUsername(principal.getName());
		Album album = albumRepository.findById(albumId);
		RatingStar rate = new RatingStar();
		RatingStarPK rating = new RatingStarPK();
		rating.setAlbumId(albumId);
		rating.setUserId(user.getId());
		rate.setRatingStar(numberStar);
		rate.setUser(user);
		rate.setAlbum(album);
		rate.setRatingstarPK(rating);
		rateRepository.save(rate);
		writeToCSV("D:/Code/WebJava/musicstore2/musicstore/data/dataset.csv",list);
		recommender(list,"D:/Code/WebJava/musicstore2/musicstore/data/dataset.csv",user);
		return "redirect:/";
	}
	
	
	
	
}
