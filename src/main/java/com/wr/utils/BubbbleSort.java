package com.wr.utils;

import java.util.List;

import com.wr.model.Sign;

public class BubbbleSort {
	
	public static List<Sign> BubbbleSort(List<Sign> signlist) {

		for(int i=0;i<signlist.size()-1;i++){
			for(int j=0;j<signlist.size()-1-i;j++){
				if(signlist.get(j).getNw() > signlist.get(j + 1).getNw()){
					Sign sign = signlist.get(j);
					signlist.set(j, signlist.get(j + 1));
					signlist.set(j + 1, sign);
				}
			}
		}
		
		return signlist; 
	}
	
}
