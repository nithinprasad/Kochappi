/**
 * 
 */
package Extraction;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import Database.DataBase;

/**
 * @author nithin
 *
 */
public class RSSUtil {

	public static void getRSSFeed(String category,String siteID,String tableName) throws Exception {
		DataBase db = new DataBase();
		db.exupdate("TRUNCATE TABLE "+tableName+";");
		String site_id = siteID;
		path u = new path();
		String s2 = u.extract_path + "\\"+category+".xml";

		try {
			Extraction.Extract obj = new Extract();
			obj.extract_news(site_id, s2);

			File inputFile = new File(s2);
			// out.println(inputFile);
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(inputFile);
			doc.getDocumentElement().normalize();
			// out.println("Root element :" + doc.getDocumentElement().getNodeName());
			NodeList nList = doc.getElementsByTagName("item");
			// out.println("----------------------------"+nList.getLength());
			int count = 0;
			for (int temp = 0; temp < nList.getLength() && temp<10; temp++) {

				Node nNode = nList.item(temp);
				// out.println("\nCurrent Element :" + nNode.getNodeName());
				String title = "", link = "", date = "", image = "";

				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					title = eElement.getElementsByTagName("title").item(0).getTextContent();
					link = eElement.getElementsByTagName("link").item(0).getTextContent();
					date = eElement.getElementsByTagName("pubdate")!=null?eElement.getElementsByTagName("pubdate").item(0)!=null?eElement.getElementsByTagName("pubdate").item(0).getTextContent():null:"";
					// out.println(eElement.getElementsByTagName("media:content").item(0).getTextContent());
					NodeList carNameList = eElement.getElementsByTagName("media:content");
					Node node1 = carNameList.item(0);
					// out.println(node1);

					if (node1.getNodeType() == node1.ELEMENT_NODE) {
						Element car = (Element) node1;
						image = car.getAttribute("url");
						count++;
						String s1 = "";
						path p = new path();
						s1 = p.path;
						URL url = new URL(image);
						String imm = "hello_" + count + ".jpg";
						BufferedImage img = ImageIO.read(url);
						File file = new File(s1 + "\\" + imm);
						ImageIO.write(img, "jpg", file);

						String qu = "insert into "+tableName+"(head,url,image,date)values('" + title + "','" + link + "','"
								+ image + "','" + date + "')";
						// out.println(qu);
						db.exupdate(qu);

					}

				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
