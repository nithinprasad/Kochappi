package com.binees.bayes.learn;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

import de.daslaboratorium.machinelearning.classifier.Classifier;
import de.daslaboratorium.machinelearning.classifier.bayes.BayesClassifier;

public class BayesUtil {

	final Classifier<String, String> bayes = new BayesClassifier<String, String>();

	static BayesUtil bayesUtil=null;
	
	private BayesUtil() {

		learn();

	}
	
	public static BayesUtil getInstance() {
		if(bayesUtil==null)
			bayesUtil=new BayesUtil();
		
		return bayesUtil;
		
	}
	

	public String getCategory(String title) {
		System.out.println(((BayesClassifier<String, String>) bayes).classifyDetailed(
                Arrays.asList(title.split("\\s"))));
		System.out.println(bayes.classify(Arrays.asList(title.split("\\s"))).getCategory());
		return bayes.classify(Arrays.asList(title.split("\\s"))).getCategory();

	}

	private void learn() {

		bayes.learn("positive", getPostiveContent());

		bayes.learn("negative", getNegativeContet());

		bayes.setMemoryCapacity(5000); // remember the last 500 learned classifications
	}

	public List<String> getPostiveContent() {
		
		Scanner s;
		ArrayList<String> list = new ArrayList<String>();
		s = new Scanner(this.getClass().getResourceAsStream("positive.txt"));
		
		while (s.hasNext()){
		    list.add(s.next());
		}
		s.close();
		

		return list;

	}

	public List<String> getNegativeContet() {
		
		Scanner s;
		ArrayList<String> list = new ArrayList<String>();
		s = new Scanner(this.getClass().getResourceAsStream("negative.txt"));
		
		while (s.hasNext()){
		    list.add(s.next());
		}
		s.close();
		

		return list;

	}

}
