package com.subra.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.fasterxml.jackson.annotation.JsonProperty;

//@XmlRootElement(name="encasing")
//@XmlAccessorType(XmlAccessType.FIELD)
public class Wrapper {

	//@XmlElement
	Name wrap;
	
	public Wrapper(){}
	public Wrapper(Name name){ this.wrap = name;}
	
	@JsonProperty("encasing")
	public Name getWrap() {
		return wrap;
	}

	public void setWrap(Name name) {
		this.wrap = name;
	}

	@Override
	public String toString() {
		return "Wrapper [wrap=" + wrap + "]";
	}

	
}
