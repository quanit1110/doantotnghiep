package quanpham.nashtech.musicstore.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.TanimotoCoefficientSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import quanpham.nashtech.musicstore.entity.Album;
import quanpham.nashtech.musicstore.entity.RatingStar;
import quanpham.nashtech.musicstore.entity.User;
import quanpham.nashtech.musicstore.repository.RateRepository;

@Service
public class RecommenService {
	@Autowired
	RateRepository rateRepository; 
	
	public List<RecommendedItem> recommenderByUser(List<RatingStar> list, String nameFile, User user) throws IOException, TasteException{
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
		return recommendations;
	}
	
	public List<RecommendedItem> recommenderItem(List<RatingStar> list, String nameFile, Album album) throws IOException, TasteException{
		list = rateRepository.findAll();
		List<RecommendedItem> recommendations = new ArrayList<>();
		try {
			DataModel dm = new FileDataModel(new File(nameFile));
			
			//ItemSimilarity sim = new LogLikelihoodSimilarity(dm);
			TanimotoCoefficientSimilarity sim = new TanimotoCoefficientSimilarity(dm);
			
			GenericItemBasedRecommender recommender = new GenericItemBasedRecommender(dm, sim);
			//int x=1;
			for(LongPrimitiveIterator items = dm.getItemIDs(); items.hasNext();) {
				long itemId = items.nextLong();
				if(album.getId() == itemId) {
				recommendations = recommender.mostSimilarItems(itemId, 5);
				for(RecommendedItem recommendation : recommendations) {
					System.out.println(itemId + "," + recommendation.getItemID() + "," + recommendation.getValue());
					
				}
				}
				//x++;
				//if(x>10) System.exit(1);
			}
			return recommendations;
						
			
			
		} catch (IOException e) {
			System.out.println("There was an error.");
			e.printStackTrace();
		} catch (TasteException e) {
			System.out.println("There was a Taste Exception");
			e.printStackTrace();
		}
		return recommendations;
	}

	public static void main(String gargs[]) throws IOException, TasteException {
		/*DataModel model = new FileDataModel(new File("data/dataset.csv"));
		UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
		UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, similarity, model);
		UserBasedRecommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
		List<RecommendedItem> recommendations = recommender.recommend(2, 5);
		for(RecommendedItem item : recommendations) {
			System.out.println(item);
		}
		*/
		try {
			DataModel dm = new FileDataModel(new File("D:/Code/WebJava/musicstore2/musicstore/data/dataset.csv"));
			
			//ItemSimilarity sim = new LogLikelihoodSimilarity(dm);
			TanimotoCoefficientSimilarity sim = new TanimotoCoefficientSimilarity(dm);
			
			GenericItemBasedRecommender recommender = new GenericItemBasedRecommender(dm, sim);
			
			//int x=1;
			for(LongPrimitiveIterator items = dm.getItemIDs(); items.hasNext();) {
				long itemId = items.nextLong();
				List<RecommendedItem>recommendations = recommender.mostSimilarItems(itemId, 5);
				
				for(RecommendedItem recommendation : recommendations) {
					System.out.println(itemId + "," + recommendation.getItemID() + "," + recommendation.getValue());
				}
				//x++;
				//if(x>10) System.exit(1);
			}
						
			
			
		} catch (IOException e) {
			System.out.println("There was an error.");
			e.printStackTrace();
		} catch (TasteException e) {
			System.out.println("There was a Taste Exception");
			e.printStackTrace();
		}
	}

}
