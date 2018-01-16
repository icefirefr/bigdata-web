package com.bigdat.query.service.impl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

import com.bigdat.query.service.WindTrubineTableInfo;

public class WindTrubineTableInfoImpl implements WindTrubineTableInfo {
	
	@Override
	public Set<String> getHeader(String farmCode) {
		Set<String> result = new HashSet<String>();
		
		Properties pps = new Properties();
		InputStream in;
		try {
			in = WindTrubineTableInfoImpl.class.getClassLoader().getResourceAsStream("windTrubineTableHead.properties");
			pps.load(in);
			String[] headers = pps.getProperty(farmCode).split(",");
			for(String header:headers){
				result.add(header);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}

}
