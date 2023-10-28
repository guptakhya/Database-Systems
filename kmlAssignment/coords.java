/* package whatever; // don't place package name! */

import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be "Main" only if the class is public. */
class coords
{
	public static void main (String[] args) throws java.lang.Exception
	{
		// your code goes here
		// your code goes here
		double R=0.006, r=0.001, a=0.008; 
		
		ArrayList<ArrayList<Double>> finalArr = new ArrayList<ArrayList<Double>>();
		
		FileWriter myWriter = new FileWriter("/Users/khyatigupta/Desktop/Test.txt");
		
		//int ind = 0;
		//ctx.moveTo(150+x0, 150+y0);
		double xStart = -118.28543607375774;
		double yStart = 34.02072194464797;
		int nRev=16;
		for(double t=0.0; t<(Math.PI*nRev); t+=0.1){
			ArrayList<Double> innerList = new ArrayList<Double>();
			double x = (R+r)*Math.cos((r/R)*t) - a*Math.cos((1+r/R)*t);
			double y = (R+r)*Math.sin((r/R)*t) - a*Math.sin((1+r/R)*t);
			innerList.add(xStart + x);
			innerList.add(yStart + y);
			finalArr.add(innerList);
		}

		//System.out.println(finalArr.size());
		
		for(ArrayList<Double> arr : finalArr){
			myWriter.write(arr.get(0) + "," + arr.get(1) + "\n");
		}
		myWriter.close();
	
	}
}



