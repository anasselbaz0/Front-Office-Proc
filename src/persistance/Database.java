package persistance;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

public class Database {
	
		private String uri = "mongodb://anass:anass@front-process-shard-00-00-gvppd.mongodb.net:27017,"
				+ "front-process-shard-00-01-gvppd.mongodb.net:27017,"
				+ "front-process-shard-00-02-gvppd.mongodb.net:27017/test?ssl=true&replicaSet=Front-Process-shard-0&authSource=admin&retryWrites=true";
		private MongoClientURI clientUri;
		private MongoClient mongoClient;
		private MongoDatabase database;
		
		MongoDatabase getConnection() {
			clientUri	= new MongoClientURI(uri);
			mongoClient	= new MongoClient(clientUri);
			database	= mongoClient.getDatabase("db_process");
			return database;
		}
		
}
