package persistance;

import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import java.util.ArrayList;
import org.bson.Document;
import org.bson.conversions.Bson;

public class DAODemande {

	private Database db;
	private MongoCollection<Document> collection;
	
	public DAODemande() {
		super();
		db = new Database();
		MongoDatabase mongodb = db.getConnection();
		collection = mongodb.getCollection("demandes");
	}
	
	public boolean deposer(String cin, String processus, ArrayList<String> documents, String jeton) {
		Document doc = new Document();
		doc.append("cin", cin);
		doc.append("processusName", processus);
		Document doc1 = new Document();
		for(int i=1; i<=documents.size(); i++) {
			doc1.append("document"+String.valueOf(i), documents.get(i-1));
		}
		doc.append("documents", doc1);
		doc.append("jeton", jeton);
		doc.append("etat", 1);
		doc.append("isAccepted", false);
		doc.append("isArchived", false);
		collection.insertOne(doc);
		return true;
	}

	public FindIterable<Document> getSomeByCIN(String cin) {
		return collection.find(new BasicDBObject("cin", cin));
	}

	public FindIterable<Document> getSomeByProc(String proc) {
		return collection.find(new BasicDBObject("processusName", proc));
	}
	
	public Document getDemande(String jeton) {
		FindIterable<Document> result = collection.find(Filters.eq("jeton", jeton));
		Document r = new Document();
		for(Document d : result)
			r = d;
		return r;
	}

	public boolean supprimerDocument(String jeton, int ordre) {
		Document myDoc = getDemande(jeton);
		ArrayList<Object> values = new ArrayList<>(myDoc.values());
		collection.deleteOne(new BasicDBObject().append("jeton", jeton));
		Document oldDocuments1 = (Document) values.get(3);
		ArrayList<Object> oldDocuments = new ArrayList<>(oldDocuments1.values());
		ArrayList<String> newDocuments = new ArrayList<>();
		for(int i=0; i<ordre; i++)
			newDocuments.add((String) oldDocuments.get(i));
		for(int i=ordre+1; i<oldDocuments.size(); i++)
			newDocuments.add((String) oldDocuments.get(i));
		return deposer((String)values.get(1), (String)values.get(2), newDocuments, jeton);
	}

	public boolean accepter(String jeton) {
		Bson filter = new Document("jeton", jeton);
		Bson newValue = new Document("isAccepted", true);
		Bson updateOperationDocument = new Document("$set", newValue);
		collection.updateOne(filter, updateOperationDocument);
		return true;
	}

	public boolean archiver(String jeton) {
		Bson filter = new Document("jeton", jeton);
		Bson newValue = new Document("isArchived", true);
		Bson updateOperationDocument = new Document("$set", newValue);
		collection.updateOne(filter, updateOperationDocument);
		return true;
	}

	public boolean traiter(String jeton) {
		Document doc = getDemande(jeton);
		ArrayList<Object> vals = new ArrayList<>(doc.values());
		int etat = (int) vals.get(5);
		Bson filter = new Document("jeton", jeton);
		Bson newValue = new Document("etat", etat+1);
		Bson updateOperationDocument = new Document("$set", newValue);
		collection.updateOne(filter, updateOperationDocument);
		return true;
	}

}
