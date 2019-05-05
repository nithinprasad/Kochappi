/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Extraction;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author LENOVO
 */
public class Extract {
	public void extract_news(String url, String path) throws IOException {
		Document ra = Jsoup.connect(url).get();

//Elements descriptions = ra.select("div[class=ie-first-story]");
		Elements descriptions = ra.select("item");

		BufferedWriter bw = null;
		FileWriter fw = null;

		File inputFile = new File(path);

		BufferedWriter htmlWriter = new BufferedWriter(
				new OutputStreamWriter(new FileOutputStream(inputFile), "UTF-8"));
		htmlWriter.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
		htmlWriter.write("<class>\n");
		htmlWriter.write(descriptions!=null?descriptions.toString().replaceAll("&nbsp;", " "):"");
		htmlWriter.write("\n</class>");
		System.out.println(descriptions!=null?descriptions.toString():"NULL");
		htmlWriter.close();
		
		Elements links = ra.select("link[type=application/rss+xml]");

		if (links.size() > 0) {
		    String rss_url = links.get(0).attr("abs:href").toString();
		    System.out.println("Rss URL"+rss_url);
		} else {
		}

	}

}
